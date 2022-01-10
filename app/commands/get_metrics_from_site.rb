class GetMetricsFromSite < PowerTypes::Command.new(:site)
  def perform
    raise  'No Site was Selected or Empty' if @site.nil? || !a_site_class?
    metrics_list
  end

  private
  def metrics_list
    categories = @site.categories
    Metric.where(category_id: categories.pluck(:id))
  end

  def a_site_class?
    @site.is_a?(Site)
  end
end
