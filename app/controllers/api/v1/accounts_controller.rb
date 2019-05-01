class Api::V1::AccountsController < Api::SecuredController
  before_action :set_account, only: [:show, :following, :followers]
  before_action :authenticate_account, only: [:following, :followers]

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

  private

  def set_account
    @account ||= Account.find(params[:id])
  end
end
