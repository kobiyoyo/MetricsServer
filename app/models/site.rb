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
class Site < ApplicationRecord
  # Callback
  after_initialize :set_default_auto, if: :new_record?

  # Associations
  has_many :categories, dependent: :destroy

  # validations
  validates :name, presence: true, uniqueness: true, length: { in: 4..50 }

  # auto value
  AUTO = %i[active inactive].freeze

  enum auto: AUTO

  def set_default_auto
    self.auto ||= :inactive
  end
end
