class SettingsDecorator < Geckorate::Decorator
  def decorate(options = {})
    {
      private_profile: private_profile?
    }.as_json
  end
end
