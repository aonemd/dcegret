class Api::V1::Posts::LikesController < Api::SecuredController
  before_action :authenticate_account
  before_action :set_post
  before_action :set_like, only: [:destroy]

  def create
    unless @post.liked_by?(current_account)
      @post.likes.create(account_id: current_account.id)
    end
    head :ok
  end

  def destroy
    @like.destroy if @post.liked_by?(current_account)
  end

  private

  def set_like
    @like ||= @post.likes.find(params[:id])
  end

  def set_post
    @post ||= Post.find(params[:post_id])
  end
end
