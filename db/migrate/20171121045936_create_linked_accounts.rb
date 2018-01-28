class CreateLinkedAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :linked_accounts do |t|
      # t.integer "user_id"
      t.references :user
      t.timestamps
    end
  end
end
