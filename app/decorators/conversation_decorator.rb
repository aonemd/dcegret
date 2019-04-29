class ConversationDecorator < Geckorate::Decorator
  include ActionView::Helpers::DateHelper

  def decorate(options: {})
    {
      id: id,
      with: AccountDecorator.new(with(options[:current_account])).decorate()['username'],
      messages: MessageDecorator.decorate_collection(messages.ordered),
      created_at: time_ago_in_words(created_at)
    }.as_json
  end
end
