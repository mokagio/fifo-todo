class ChangeTaskSkinCountDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column_default :tasks, :skip_count, 0
  end
end
