class ScraperController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        scraper = Scraper.find_or_create_by!(scraper_params)
        
        if scraper.save!
            ScraperJob.perform_now(scraper)

            product = Product.includes(:sizes, :categories).find_by(scraper: scraper)
            render json: product, include: [:sizes, :categories], status: :ok            
        else
            render json: { status: 'Error', message: 'Something Went Wrong' }, status: :unprocessable_entity
        end
    end

    def show
        scraper = Scraper.find(params[:id])
        ScraperJob.perform_now(scraper)

        product = Product.includes(:sizes, :categories).find_by(scraper: scraper)
        render json: product, include: [:sizes, :categories], status: :ok
    rescue ActiveRecord::RecordNotFound
        render json: { error: 'Product not found' }, status: :not_found
    end

    private

    def scraper_params
        params.require(:scraper).permit(:url)
    end
  end