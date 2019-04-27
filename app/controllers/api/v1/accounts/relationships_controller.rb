class Api::V1::Accounts::RelationshipsController < Api::SecuredController
  before_action :authenticate_account

  def create
    account = Account.find(params[:followed_id])
    current_account.follow(account)
  end

  def destroy
    account = Account.find(params[:id])
    current_account.unfollow(account)
  end

  def is_following
    account = Account.find(params[:id])
    render json: { is_following: account.followed_by?(current_account) }
  end
end
