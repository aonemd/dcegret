class MessageDecorator < Geckorate::Decorator
  include ActionView::Helpers::DateHelper

  def decorate(options = {})
    {
      body: body,
      username: account.username,
      created_at: time_ago_in_words(created_at)
    }.as_json
  end
end

