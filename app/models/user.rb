class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true
  validates :email, :uniqueness =>{:case_sensitive => false}

  validates :password, presence: true, length: {minimum: 6}, confirmation: {case_sensitive: true}
  validates :password_confirmation, presence: true, length: {minimum: 6}

  def self.authenticate_with_credentials(email, password)
    #format input email for lowercase
    formatted_email = email.downcase.lstrip

    # Check that there is a user with given email
    user = User.find(email: formatted_email)

    #Once found, confirm password match using authentication
    ## return that we found both the requested user AND the password matches
    user && user.authenticate(password)
  end
end
