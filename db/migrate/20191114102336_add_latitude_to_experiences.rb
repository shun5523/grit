class AddLatitudeToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :latitude, :float
  end
end
