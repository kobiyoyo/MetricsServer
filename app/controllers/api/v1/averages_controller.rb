class Api::V1::AveragesController < ApplicationController
  before_action :set_site, only: [:index]

  def index
    @metrics = GetMetricsFromSite.for(site: @site)
    @stats = GetAverageCount.for(metrics: @metrics)
    render json: @stats
  end

  private

  def set_site
    @site = Site.find(params[:site_id])
  end

end