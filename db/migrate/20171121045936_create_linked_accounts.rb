class CreateLinkedAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :linked_accounts do |t|

      t.timestamps
    end
  end
end
