class Api::V1::Accounts::SettingsController < Api::SecuredController
  before_action :authenticate_account

  def index
    render json: {
      settings: SettingsDecorator.new(current_account.settings).decorate
    }
  end

  def update
    current_account.settings.update(settings_params)
  end

  private

  def settings_params
    params.require(:settings).permit(:private_profile)
  end
end
