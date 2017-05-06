class User < ApplicationRecord

  # gives User model authentication methods viz bcrypt (which came downloaded with rails)
  has_secure_password

  has_many :contacts

end
