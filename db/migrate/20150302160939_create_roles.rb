class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.references :user
      t.integer :role
      t.timestamps
    end
    add_index :roles, :role
  end
end
