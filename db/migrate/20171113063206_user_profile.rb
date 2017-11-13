class UserProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :twitter, :string
    add_column :users, :language, :string
  end
end
