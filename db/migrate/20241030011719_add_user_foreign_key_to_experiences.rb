class AddUserForeignKeyToExperiences < ActiveRecord::Migration[7.2]
  def change
    add_reference :experiences, :user, index: true
  end
end
