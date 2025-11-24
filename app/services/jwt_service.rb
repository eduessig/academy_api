class JwtService
  SECRET_KEY = Rails.application.secret_key_base

  def self.encode(payload, exp = 5.minutes.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(decoded)
  rescue JWT::ExpiredSignature
    raise :token_expired
  rescue JWT::DecodeError
    raise :invalid_token
  end
end
