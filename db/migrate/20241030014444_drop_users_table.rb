class DropUsersTable < ActiveRecord::Migration[7.2]
  def up
    drop_table :users, force: :cascade
  end

  def down
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string :municipality
    end
  end
end
