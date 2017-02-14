class CreateTask < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :priority, default: 1
      t.boolean :done, default: false
      t.integer :skip_count

      t.timestamps
    end
  end
end
