class CreateDummies < ActiveRecord::Migration[5.1]
  def change
    create_table :dummies do |t|
      t.string :a
      t.integer :b
      t.float :c
      t.boolean :d
      t.string :e

      t.timestamps
    end
  end
end
