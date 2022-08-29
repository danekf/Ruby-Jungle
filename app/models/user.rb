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
    # Check that there is a user with given email
    user = User.find_by_email(email.strip.downcase)

    #Once found, confirm password match using authentication
    if user && user.authenticate(password)
      # if match, return the user that was found
      user
    else
      nil
    end
  end
end
