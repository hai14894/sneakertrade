class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shoes
  has_one_attached :picture
  def user_picture_attach 
    picture.attached? ? picture : "avatar.jpeg"
  end
end
