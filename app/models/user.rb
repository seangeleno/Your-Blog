class User < ActiveRecord::Base

  has_secure_password

  has_attached_file :avatar , styles: { medium: "300x300>" , thumb: "100x100>" } , default_url: "http://icons.iconarchive.com/icons/hopstarter/iron-man-avatar/256/Iron-Man-Mark-V-01-icon.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :blogs
  has_many :comments , through: :blogs

end
