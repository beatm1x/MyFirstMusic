class CreatePrivileges < ActiveRecord::Migration
  def change
    create_table :privileges do |t|
      t.string :name
      t.string :value
      t.string :type

      t.timestamps
    end
  end
end
