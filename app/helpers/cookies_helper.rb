module CookiesHelper
  def decrypt_cookie_value(name)
    encrypted_value = cookies.encrypted[name]
    return nil unless encrypted_value

    serializer = Rails.application.message_verifier(:cookie_serializer)
    serializer.verify(encrypted_value)
  end
end