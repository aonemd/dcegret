class ConversationDecorator < Geckorate::Decorator
  include ActionView::Helpers::DateHelper

  def decorate
    {
      id: id,
      messages: messages,
      created_at: time_ago_in_words(created_at)
    }.as_json
  end
end
