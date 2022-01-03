class Api::V1::MetricsController < ApplicationController
  before_action :set_metric, only: %i[update destroy]
  before_action :set_site, only: [:index]

  def index
    @categories = @site.categories.includes(:metrics)
    @metrics = @categories.map(&:metrics).flatten
    render json: @metrics
  end

  def create
    @metric = Metric.new(metric_params)

    if @metric.save
      render json: @metric, status: :created
    else
      render json: @metric.errors, status: :unprocessable_entity
    end
  end

  def update
    if @metric.update(metric_params)
      render json: @metric
    else
      render json: @metric.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @metric.destroy
  end

  private

  def set_metric
    @metric = Metric.find(params[:id])
  end

  def set_site
    @site = Site.find(params[:site_id])
  end

  def metric_params
    params.permit(:name, :value, :category_id)
  end
end
