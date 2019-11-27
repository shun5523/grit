class CreateExperiencePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :experience_pictures do |t|
      t.integer :experience_id
      t.text :experience_image_id

      t.timestamps
    end
  end
end
