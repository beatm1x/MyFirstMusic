class CreateUserUploads < ActiveRecord::Migration
  def change
    create_table :user_uploads do |t|
      t.references :user
      t.references :upload

      t.timestamps
    end
    add_index :user_uploads, :user_id
    add_index :user_uploads, :upload_id
  end
end
