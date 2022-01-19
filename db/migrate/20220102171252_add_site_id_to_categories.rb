class AddSiteIdToCategories < ActiveRecord::Migration[6.1]
  def change
    add_reference :categories, :site, null: false, foreign_key: true
  end
end
