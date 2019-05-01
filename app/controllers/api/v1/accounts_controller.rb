class Api::V1::AccountsController < Api::SecuredController
  before_action :set_account, only: [:show, :following, :followers, :accept_request]
  before_action :authenticate_account, only: [:following, :followers, :requested_followers, :accept_request]

  def index
    render json: { accounts: AccountDecorator.decorate_collection(Account.all) }
  end

  def show
    render json: { account: AccountDecorator.new(@account).decorate }
  end

  def following
    if @account != current_account &&
        @account.settings.private_profile? &&
        !current_account.following?(@account)
      unauthorized!
    else
      render json: { accounts: AccountDecorator.decorate_collection(@account.following) }
    end
  end

  def followers
    if @account != current_account &&
        @account.settings.private_profile? &&
        !current_account.following?(@account)
      unauthorized!
    else
      render json: { accounts: AccountDecorator.decorate_collection(@account.followers) }
    end
  end

  def requested_followers
    render json: {
      accounts: AccountDecorator.decorate_collection(current_account.requested_followers)
    }
  end

  def accept_request
    Account::Relationship.where(follower: @account,
                                followed: current_account).first.update(accepted: true)
    head :ok
  end

  private

  def set_account
    @account ||= Account.find(params[:id])
  end
end
