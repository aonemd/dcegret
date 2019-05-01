class Api::V1::Accounts::PostsController < Api::SecuredController
  before_action :authenticate_account

  def index
    posts = current_account.posts
    render json: { posts: PostDecorator.decorate_collection(posts, current_account: current_account) }
  end

  def create
    post = current_account.posts.new(post_params)
    post.save!
    render json: { post: PostDecorator.new(post).decorate }
  end

  private

  def post_params
    params.require(:post).permit(:content, :private)
  end
end
