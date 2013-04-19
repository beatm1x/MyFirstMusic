class CreateUserAudios < ActiveRecord::Migration
  def change
    create_table :user_audios do |t|
      t.references :user
      t.references :audio

      t.timestamps
    end
    add_index :user_audios, :user_id
    add_index :user_audios, :audio_id
  end
end
