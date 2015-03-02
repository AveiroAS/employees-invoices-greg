class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :provider
      t.string :uid
      t.string :token
      t.string :image_name
      t.string :image_uid
    end
    add_index :users, [:uid, :provider]
    add_index :users, :token
  end
end
