# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  site_id    :bigint           not null
#
# Indexes
#
#  index_categories_on_site_id  (site_id)
#
# Foreign Keys
#
#  fk_rails_...  (site_id => sites.id)
#
class Category < ApplicationRecord
  # Associations
  has_many :metrics
  belongs_to :site

  # validations
  validates :name, presence: true, uniqueness: true, length: { in: 4..50 }
end
