class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :hash
      t.string :user_id

      t.timestamps
    end
  end
end
