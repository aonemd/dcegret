require 'jwt_encoder_decoder'

class Api::V1::RegistrationsController < ApplicationController
  def create
    account = Account.new(registration_params)

    account.save!
    jwt = JWTEncoderDecoder.encode(user_id: account.id,
                                   username: account.username,
                                   email: account.email)

    render json: { token: jwt }, status: :ok
  end

  private

  def registration_params
    params.permit(:email, :username, :password)
  end
end
