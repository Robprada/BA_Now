class AddMunicipalityToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :municipality, :string
  end
end
