# == Schema Information
#
# Table name: metrics
#
#  id          :bigint           not null, primary key
#  value       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_metrics_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Metric < ApplicationRecord
  # Associations
  belongs_to :category

  # Validations
  validates :value, presence: true,
                    numericality: true, inclusion: 0..100

  validates :category_id, presence: true
end
