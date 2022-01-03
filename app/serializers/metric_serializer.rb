class MetricSerializer < ActiveModel::Serializer
  attributes :id, :value
  belongs_to :category
end
