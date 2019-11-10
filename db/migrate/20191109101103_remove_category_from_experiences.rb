class RemoveCategoryFromExperiences < ActiveRecord::Migration[5.2]
  def change
    remove_column :experiences, :category, :string
  end
end
