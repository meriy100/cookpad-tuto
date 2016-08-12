class AddRecomendedToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :recomended, :boolean, null: false, default: false
  end
end
