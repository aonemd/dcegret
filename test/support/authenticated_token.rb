require 'jwt_encoder_decoder'

module AuthenticatedToken
  def authenticated_account_token
    account = Account.new
    Account.stubs(:exists?).returns(true)
    Account.stubs(:find_by!).returns(account)

    JWTEncoderDecoder.encode({ account_id: 1 })
  end
end
