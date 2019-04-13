require 'jwt_encoder_decoder'

class Api::V1::RegistrationsController < ApplicationController
  def create
    account = Account.new(registration_params)

    if account.save
      jwt = JWTEncoderDecoder.encode(user_id: account.id, username: account.username, email: account.email)
      render json: { token: jwt }, status: :ok
    else
      render json: { errors: account.errors.full_messages }, status: :bad_request
    end
  end

  private

  def registration_params
    params.permit(:email, :username, :password)
  end
end
