class CreateColorGachas < ActiveRecord::Migration[5.1]
  def change
    create_table :color_gachas do |t|
      t.string :rank
      t.string :color

      t.timestamps
    end
  end
end
