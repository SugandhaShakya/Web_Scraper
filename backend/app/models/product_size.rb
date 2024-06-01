class ProductSize < ApplicationRecord
  belongs_to :product
  belongs_to :size

  validates :product_id, uniqueness: { scope: :size_id }
end
