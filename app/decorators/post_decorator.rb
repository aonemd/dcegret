class PostDecorator < Geckorate::Decorator
  include ActionView::Helpers::DateHelper

  def decorate(options = {})
    {
      content: content,
      account: AccountDecorator.new(account).decorate,
      created_at: time_ago_in_words(created_at)
    }.as_json
  end
end
