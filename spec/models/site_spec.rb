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
  pending "add some examples to (or delete) #{__FILE__}"
end
