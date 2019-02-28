class Product < ApplicationRecord
  belongs_to :shop
  belongs_to :category
  has_many_attached :images
end
