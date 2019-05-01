class Api::V1::PostsController < Api::SecuredController
  before_action :authenticate_account

  def index
    render json: { posts: PostDecorator.decorate_collection(Post.public_posts, current_account: current_account) }
  end

  def by_account
    if set_account != current_account &&
        set_account.settings.private_profile? &&
        !set_account.followed_by?(current_account)
      unauthorized!
    else
      render json: {
        posts: PostDecorator.decorate_collection(set_account.posts.public_posts, current_account: current_account)
      }
    end
  end

  private

  def set_account
    @account ||= Account.find(params[:id])
  end
end
