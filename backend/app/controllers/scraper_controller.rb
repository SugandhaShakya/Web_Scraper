class ScraperController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        scraper = Scraper.find_or_create_by!(scraper_params)
        
        if scraper.save!
            ScraperJob.perform_later(scraper)
            render json: { status: 'SUCCESS', message: 'Scraped Successfully' }, status: :created
        else
            render json: { status: 'Error', message: 'Something Went Wrong' }, status: :unprocessable_entity
        end
      end
    private

    def scraper_params
        params.require(:scraper).permit(:url)
    end
  end