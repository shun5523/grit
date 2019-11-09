class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.integer :problem_id
      t.integer :experience_id
      t.text :post_image_id

      t.timestamps
    end
  end
end
