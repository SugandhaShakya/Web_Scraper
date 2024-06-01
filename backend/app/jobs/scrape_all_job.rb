class ScrapeAllJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    Rails.logger.info "ScraperJob started at #{Time.now}"

    Scraper.all.each do |scraper|
      p scraper
      ScraperService.new(scraper.url).call
    end
  end
end
