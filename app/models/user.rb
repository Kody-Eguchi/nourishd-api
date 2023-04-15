class User < ApplicationRecord
  has_secure_password
  has_many :favourites
  has_many :days
  


  def authenticate_with_credentials(email, password)
    email = email.downcase.strip
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

end
