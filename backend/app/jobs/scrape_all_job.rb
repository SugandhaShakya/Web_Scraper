class ScrapeAllJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later

    Scraper.all.each do |scraper|
      ScraperService.new(scraper.url).call
    end
  end
end
