# == Schema Information
#
# Table name: sites
#
#  id         :bigint           not null, primary key
#  auto       :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SiteSerializer < ActiveModel::Serializer
  attributes :id, :name, :auto
end
