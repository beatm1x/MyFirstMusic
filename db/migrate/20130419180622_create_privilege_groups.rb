class CreatePrivilegeGroups < ActiveRecord::Migration
  def change
    create_table :privilege_groups do |t|
      t.references :group
      t.references :privilege

      t.timestamps
    end
    add_index :privilege_groups, :group_id
    add_index :privilege_groups, :privilege_id
  end
end
