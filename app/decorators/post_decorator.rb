class PostDecorator < Geckorate::Decorator
  include ActionView::Helpers::DateHelper

  def decorate(options = {})
    {
      id: id,
      content: content,
      account: AccountDecorator.new(account).decorate,
      like_id: likes.find_by(account_id: options[:current_account].id).try(:id),
      created_at: time_ago_in_words(created_at)
    }.as_json
  end
end
