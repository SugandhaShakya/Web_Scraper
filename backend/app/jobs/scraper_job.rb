class ScraperJob < ApplicationJob
  queue_as :default

  def perform(scraper)
    data = ScraperService.new(scraper.url).call

    return if data["title"].blank?
  
    product = Product.find_or_create_by!(scraper: scraper)
    product.update!(name: data["title"].first, 
                    description: data["description"].first, 
                    price: data["price"].first,
                    details: data["details"].to_json)
    
    data["categories"].each do |category_name|
      category = Category.find_or_create_by!(name: category_name.strip)
      unless ProductCategory.exists?(product: product, category: category)
        ProductCategory.create!(product: product, category: category)
      end
    end

    data["sizes"].each do |size_name|
      size = Size.find_or_create_by!(name: size_name.strip)
      unless ProductSize.exists?(product: product, size: size)
        ProductSize.create!(product: product, size: size)
      end
    end
  end
end
