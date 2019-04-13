require 'jwt_encoder_decoder'

class Api::V1::SessionsController < ApplicationController
  def create
    account = Account.find_by_identity(login_params[:identity])

    if account && account.authenticate(login_params[:password])
      jwt = JWTEncoderDecoder.encode(account_id: account.id, username: account.username, email: account.email)
      render json: { token: jwt }, status: :ok
    else
      head :unauthorized
    end
  end

  private

  def login_params
    params.permit(:identity, :password)
  end
end
