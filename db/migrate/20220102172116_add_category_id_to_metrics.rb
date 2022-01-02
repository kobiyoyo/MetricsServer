class AddCategoryIdToMetrics < ActiveRecord::Migration[6.1]
  def change
    add_reference :metrics, :category, null: false, foreign_key: true
  end
end
