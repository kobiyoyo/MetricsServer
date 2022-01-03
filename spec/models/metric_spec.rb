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
require 'rails_helper'

RSpec.describe Metric, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:category)}
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:value) }
    it { should validate_inclusion_of(:value).in_range(0..100) }
    it { is_expected.to validate_presence_of(:category_id) }
  end
end
