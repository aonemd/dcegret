require 'jwt_encoder_decoder'

class Api::SecuredController < ApplicationController

  protected

  def authenticate_account
    unauthorized! unless valid_header? && valid_payload?
  end

  def current_account
    @current_account ||= Account.find_by!(id: payload[:account_id])
  end

  def unauthorized!
    render json: { errors: ['Unauthenticated'] }, status: :unauthorized
    return
  end

  private

  def valid_header?
    !!request.env.fetch('HTTP_AUTHORIZATION', '').scan(/Bearer/).flatten.first
  end

  def valid_payload?
    payload && Account.exists?(id: payload[:account_id]) && !JWTEncoderDecoder.expired?(payload)
  end

  def payload
    @payload ||= JWTEncoderDecoder.decode(token)
  end

  def token
    request.env.fetch('HTTP_AUTHORIZATION', '').scan(/Bearer (.*)$/).flatten.last
  end
end
