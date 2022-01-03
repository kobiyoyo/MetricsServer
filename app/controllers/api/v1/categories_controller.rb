class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:update, :destroy]
  before_action :set_site, only: [:index] 

  def index
    @categories = @site.categories

    render json: @categories
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def set_site
      @site = Site.find(params[:site_id])
    end

    def category_params
      params.permit(:name)
    end
end
