require 'jwt_encoder_decoder'

class Api::V2::RegistrationsController < ApplicationController
  def create
    account = Account.create_with_settings(registration_params)
    token   = JWTEncoderDecoder.encode(id: account.id)

    render json: { token: token }, status: :ok
  end

  private

  def registration_params
    params.permit(:email, :username, :password)
  end
end
