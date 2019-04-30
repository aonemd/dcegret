class Api::V1::PostsController < Api::SecuredController
  before_action :authenticate_account

  def index
    render json: { posts: PostDecorator.decorate_collection(Post.public_posts, current_account: current_account) }
  end

  def by_account
    render json: { posts: PostDecorator.decorate_collection(set_account.posts.public_posts) }
  end

  private

  def set_account
    @account ||= Account.find(params[:id])
  end
end
