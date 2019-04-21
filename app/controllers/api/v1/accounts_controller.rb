class Api::V1::AccountsController < Api::SecuredController
  before_action :set_account, only: [:show, :following, :followers]

  def index
    render json: { accounts: AccountDecorator.decorate_collection(Account.all) }
  end

  def show
    render json: { account: AccountDecorator.new(@account).decorate }
  end

  def following
    render json: { accounts: AccountDecorator.decorate_collection(@account.following) }
  end

  def followers
    render json: { accounts: AccountDecorator.decorate_collection(@account.followers) }
  end

  private

  def set_account
    @account ||= Account.find(params[:id])
  end
end
