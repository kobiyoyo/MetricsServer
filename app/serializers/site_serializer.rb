class SiteSerializer < ActiveModel::Serializer
  attributes :id, :name, :auto
  has_many :categories
end
