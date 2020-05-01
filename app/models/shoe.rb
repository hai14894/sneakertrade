class Shoe < ApplicationRecord
  enum condition: {brand_new: 1, used: 0}
  belongs_to :location
  belongs_to :user
end
