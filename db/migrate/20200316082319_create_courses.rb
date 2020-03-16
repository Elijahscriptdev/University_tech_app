class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :short_name
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
