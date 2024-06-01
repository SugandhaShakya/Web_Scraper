class Scraper < ApplicationRecord
    has_one :product, dependent: :destroy
end
