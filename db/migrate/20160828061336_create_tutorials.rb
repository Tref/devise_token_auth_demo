class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.integer :mang_id
      t.string :title

      t.timestamps null: false
    end
    add_index :tutorials, :mang_id
  end
end
