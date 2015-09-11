class User < ActiveRecord::Base
  has_secure_password
  has_many :blogs
  has_many :comments , through: :blogs
end
