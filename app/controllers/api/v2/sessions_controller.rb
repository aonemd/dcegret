require 'jwt_encoder_decoder'

class Api::V2::SessionsController < ApplicationController
  def create
    account = Account.find_by_identity(session_params[:identity])

    if account && account.authenticate(session_params[:password])
      token = JWTEncoderDecoder.encode(id: account.id)
      render json: { token: token }, status: :ok
    else
      render json: { errors: ['Unauthenticated'] }, status: :unauthorized
    end
  end

  private

  def session_params
    params.permit(:identity, :password)
  end
end
