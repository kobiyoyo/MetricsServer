class CategorySerializer < ActiveModel::Serializer
    attributes :id, :name, :site_id
    has_many :metrics
end