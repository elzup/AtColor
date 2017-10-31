class CreatePixels < ActiveRecord::Migration[5.1]
  def change
    create_table :pixels do |t|
      t.integer :x
      t.integer :y
      t.string :color

      t.timestamps
    end
  end
end
