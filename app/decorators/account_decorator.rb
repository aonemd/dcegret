class AccountDecorator < Geckorate::Decorator
  def decorate
    {
      email: email,
      username: username
    }.as_json
  end
end

