class AddPhotoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :location, :string
    add_column :users, :photo, :string
    add_column :users, :phone, :string
    add_column :users, :description, :text
    add_column :users, :payment_preferences, :string
  end
end
