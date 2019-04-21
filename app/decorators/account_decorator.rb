class AccountDecorator < Geckorate::Decorator
  def decorate
    {
      id: id,
      email: email,
      username: username
    }.as_json
  end
end

