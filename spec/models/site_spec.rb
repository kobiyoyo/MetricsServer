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
require 'rails_helper'

RSpec.describe Site, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:categories) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(4) }
  end
end
