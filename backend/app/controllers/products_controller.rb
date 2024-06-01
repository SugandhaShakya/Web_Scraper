class ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        products = Product.includes(:sizes, :categories)
        render json: products, include: [:sizes, :categories]
    end

    def show
        product = Product.includes(:sizes, :categories).find(params[:id])
        render json: product, include: [:sizes, :categories]
    rescue ActiveRecord::RecordNotFound
        render json: { error: 'Product not found' }, status: :not_found
    end

    def search
        products = Product.includes(:sizes, :categories).where("name LIKE ?", "%#{params[:query]}%")
        render json: products, include: [:sizes, :categories]
    end

end
