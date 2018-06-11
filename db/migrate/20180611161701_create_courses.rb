class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :category
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.string :photo
      t.string :location
      t.float :price
      t.integer :capacity
      t.text :prerequisite
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
