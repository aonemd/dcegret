class AccountDecorator < Geckorate::Decorator
  def decorate
    {
      id: id,
      email: email,
      username: username,
      following_count: following.count,
      follower_count: followers.count
    }.as_json
  end
end

