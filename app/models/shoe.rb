class Shoe < ApplicationRecord
  enum condition: {brand_new: 1, used: 0}
  belongs_to :location
  belongs_to :user
  has_many_attached :picture

  def shoe_attachment_path
    picture.attached? ? picture[0] : "default.jpeg"

  end
end
