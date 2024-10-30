class AddAddressToExperiences < ActiveRecord::Migration[7.2]
  def change
    add_column :experiences, :address, :string
  end
end
