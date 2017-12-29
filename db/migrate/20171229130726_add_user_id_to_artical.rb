class AddUserIdToArtical < ActiveRecord::Migration
  def change
    add_column :articals , :user_id , :integer
  end
end
