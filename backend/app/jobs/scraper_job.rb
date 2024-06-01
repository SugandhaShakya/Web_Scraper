class ScraperJob < ApplicationJob
  queue_as :default

  def perform(scraper)
    data = ScraperService.new(scraper.url).call
    product = Product.create!(name: data["title"].first, 
                              description: data["description"].first, 
                              price: data["price"].first,
                              details: data["details"].to_json)
    
    data["categories"].each do |category_name|
      category = Category.find_or_create_by!(name: category_name.strip)
      ProductCategory.create!(product: product, category: category)
    end

    data["sizes"].each do |size_name|
      size = Size.find_or_create_by!(name: size_name.strip)
      ProductSize.create!(product: product, size: size)
    end
  end
end
