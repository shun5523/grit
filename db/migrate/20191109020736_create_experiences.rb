class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.integer :user_id
      t.string :category
      t.string :title
      t.text :body
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
