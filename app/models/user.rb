class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true

  validates :email, presence: true
  validates :email, :uniqueness =>{:case_sensitive => false}

  validates :password, presence: true, length: {minimum: 6}, confirmation: {case_sensitive: true}
  validates :password_confirmation, presence: true, length: {minimum: 6}

end
