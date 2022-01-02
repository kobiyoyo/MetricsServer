class Api::V1::SitesController < ApplicationController
  before_action :set_site, only: [:show, :update, :destroy]

  def index
    @sites = Site.all

    render json: @sites
  end

  def show
    render json: @site
  end

  def create
    @site = Site.new(site_params)

    if @site.save
      render json: @site, status: :created, location: @site
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  def update
    if @site.update(site_params)
      render json: @site
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @site.destroy
  end

  private
    def set_site
      @site = Site.find(params[:id])
    end

    def site_params
      params.permit(:name, :auto)
    end
end
