class RemoveNameFromMetrics < ActiveRecord::Migration[6.1]
  def change
    remove_column :metrics, :name, :string
  end
end
