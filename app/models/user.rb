class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true

  validates :email, presence: true
  validates :email, :uniqueness =>{:case_sensitive => false}

  validates :password, presence: true
  validates :password, length: {minimum: 6}
  validates :password_confirmation, presence: true
  validates :password_confirmation, length: {minimum: 6}

end
