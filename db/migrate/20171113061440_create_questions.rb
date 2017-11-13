class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :name
      t.integer :point
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
