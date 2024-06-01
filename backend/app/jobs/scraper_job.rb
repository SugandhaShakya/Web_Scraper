class ScraperJob < ApplicationJob
  queue_as :default

  def perform(scraper)
    data = ScraperService.new(scraper.url).call
    p data
  end
end
