class Api::V1::PostsController < Api::SecuredController
  def index
    render json: { posts: PostDecorator.decorate_collection(Post.all) }
  end

  def create
    post = Post.new(post_params)
    post.save!
    render json: { post: PostDecorator.new(post).decorate }
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
