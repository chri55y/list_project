class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      # t.integer "list_item_id"
      t.references :list_item
      # t.integer "linked_account_id"
      t.references :linked_account
      t.timestamps
    end
  end
end
