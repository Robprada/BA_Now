class CreateExperiences < ActiveRecord::Migration[7.2]
  def change
    create_table :experiences do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :availability

      t.timestamps
    end
  end
end
