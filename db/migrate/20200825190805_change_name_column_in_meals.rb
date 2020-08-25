class ChangeNameColumnInMeals < ActiveRecord::Migration[6.0]
  def change
    rename_column :meals, :type, :tagname
  end
end
