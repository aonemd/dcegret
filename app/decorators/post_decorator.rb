class PostDecorator < Geckorate::Decorator
  include ActionView::Helpers::DateHelper

  def decorate(options = {})
    out = {
      id: id,
      content: content,
      account: AccountDecorator.new(account).decorate,
      likes_count: likes.size,
      created_at: time_ago_in_words(created_at)
    }

    if options[:current_account]
      out[:like_id] = likes.find_by(account_id: options[:current_account].id).try(:id)
    end

    out.as_json
  end
end
