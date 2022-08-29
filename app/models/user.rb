class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true
  validates :email, :uniqueness =>{:case_sensitive => false}

  validates :password, presence: true, length: {minumum: 6}
  validates :password_confirmation, presence: true, length: {minumum: 6}

end
