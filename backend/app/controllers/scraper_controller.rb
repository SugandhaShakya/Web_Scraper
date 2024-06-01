class ScraperController < ApplicationController
    skip_before_action :verify_authenticity_token

    def get
        # scraper = Scraper.new(scraper_params)
        render json: { status: 'SUCCESS', message: 'Product created successfully' }
    end

    def create
        scraper = Scraper.new(scraper_params)
        if scraper.save!
            ScraperJob.perform_later(scraper)
            render json: { status: 'SUCCESS', message: 'Scraped Succesfully' }, status: :created
        else
            render json: { status: 'Error', message: 'Something Went Wrong' },  status: :unprocessable_entity
        end
    end
    private

    def scraper_params
        params.require(:scraper).permit(:url)
    end
  end