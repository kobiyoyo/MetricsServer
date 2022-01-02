class Api::V1::MetricsController < ApplicationController
  before_action :set_metric, only: [:show, :update, :destroy]

  def index
    @metrics = Metric.all

    render json: @metrics
  end

  def create
    @metric = Metric.new(metric_params)

    if @metric.save
      render json: @metric, status: :created, location: @metric
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

    def metric_params
      params.permit(:name, :value)
    end
end
