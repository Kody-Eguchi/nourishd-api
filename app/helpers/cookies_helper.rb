# require 'action_controller/cookies'
module CookiesHelper
  include ActionController::Cookies
  def decrypt_cookie_value(name)
    encrypted_value = cookies.encrypted[name]
    return nil unless encrypted_value
    decrypted_value = encrypted_value
    encrypted_value.fetch("user_id")
  end
end