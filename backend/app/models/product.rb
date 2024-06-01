class Product < ApplicationRecord
  belongs_to :scraper

  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :product_sizes
  has_many :sizes, through: :product_sizes

  validates :scraper, presence: true, uniqueness: true
end
