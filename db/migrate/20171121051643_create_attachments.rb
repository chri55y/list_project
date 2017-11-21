class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.integer "list_item_id"
      t.integer "linked_account_id"
      t.timestamps
    end
  end
end
