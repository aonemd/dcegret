class Api::V1::PostsController < Api::SecuredController
  before_action :authenticate_account, only: [:create]

  def index
    render json: { posts: PostDecorator.decorate_collection(Post.all) }
  end
end
