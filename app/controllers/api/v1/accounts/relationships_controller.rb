class Api::V1::Accounts::RelationshipsController < Api::SecuredController
  before_action :authenticate_account

  def create
    account = Account.find(params[:followed_id])
    current_account.follow(account)
  end

  def destroy
    account = Account::Relationship.find(params[:id]).followed
    current_account.unfollow(account)
  end
end
