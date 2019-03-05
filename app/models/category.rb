class Category < ApplicationRecord
  belongs_to :shop
  has_many :products
  has_one_attached :image
end
