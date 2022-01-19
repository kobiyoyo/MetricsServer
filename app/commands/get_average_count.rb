class GetAverageCount < PowerTypes::Command.new(:metrics)
  def perform
    raise 'No Metric was Selected or Empty' if @metrics.nil? || !a_metric_class?

    metrics_statistics
  end

  private

  def average_count(time)
    zero = 0
    metrics_sum = @metrics.averages(time).sum(:value)
    metrics_count = @metrics.averages(time).count
    return metrics_sum / metrics_count.to_f if metrics_count.positive?

    zero
  end

  def a_metric_class?
    @metrics.first.is_a?(Metric)
  end

  def metrics_statistics
    {
      per_minute: average_count(1.minute.ago),
      per_hour: average_count(1.hour.ago),
      per_day: average_count(24.hour.ago)
    }
  end
end
