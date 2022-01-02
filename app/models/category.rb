class Category < ApplicationRecord
  has_many :metrics
  belongs_to :site
end
