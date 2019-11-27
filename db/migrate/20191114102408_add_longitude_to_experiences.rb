class AddLongitudeToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :longitude, :float
  end
end
