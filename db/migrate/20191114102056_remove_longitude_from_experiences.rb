class RemoveLongitudeFromExperiences < ActiveRecord::Migration[5.2]
  def change
    remove_column :experiences, :longitude, :integer
  end
end
