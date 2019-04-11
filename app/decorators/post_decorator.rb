class PostDecorator < Geckorate::Decorator
  def decorate
    {
      content: content
    }.as_json
  end
end
