class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :user_id
      t.string :file_name
      t.string :file_uid
      t.string :name
      t.text :description
      t.float :amount
      t.boolean :approved

      t.timestamps null: false
    end
    add_index :documents, :user_id
  end
end
