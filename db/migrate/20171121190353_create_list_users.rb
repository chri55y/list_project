class CreateListUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :list_users do |t|
      t.integer "list_item_id"
      t.integer "user_id"
      t.string "permissions"
      t.timestamps
    end

    add_index("list_users", ["list_item_id", "user_id"])

  end
end
