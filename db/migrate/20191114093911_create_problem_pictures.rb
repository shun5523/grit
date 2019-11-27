class CreateProblemPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :problem_pictures do |t|
      t.integer :problem_id
      t.text :problem_image_id

      t.timestamps
    end
  end
end
