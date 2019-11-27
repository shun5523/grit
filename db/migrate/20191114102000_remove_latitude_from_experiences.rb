class RemoveLatitudeFromExperiences < ActiveRecord::Migration[5.2]
  def change
    remove_column :experiences, :latitude, :integer
  end
end
