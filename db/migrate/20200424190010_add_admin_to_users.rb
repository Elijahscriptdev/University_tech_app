class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :admin, :boolean, default: false
  end
end
