class Site < ApplicationRecord
  has_many :categories
  has_many :metrics
end
