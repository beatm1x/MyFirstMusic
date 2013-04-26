class AddNameColumnToUserAudios < ActiveRecord::Migration
  def change
    add_column :user_audios, :name, :string
  end
end
