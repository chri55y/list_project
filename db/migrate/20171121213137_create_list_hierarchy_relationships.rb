class CreateListHierarchyRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :list_hierarchy_relationships do |t|
      # t.integer "parent_item_id"
      # t.integer "child_item_id"
      #
      # t.references :parent, references: :list_items
      # t.references :child, references: :list_items

      # t.references  :list_items, :parent
      # t.references  :list_items, :child
      #
      # t.references  (:list_items, :parent)
      # t.references  (:list_items, :child)

      t.integer "parent_id", "child_id"


      t.boolean "active"
      t.integer "status"
      t.integer "position"

      # custody issues
      t.boolean "primary_custody"

      # relationship specific content
      t.text "relationship_notes"


      t.timestamps
    end

    # add_foreign_key :list_hierarchy_relationships, :list_items, column: parent_id, primary_key: :id
    # add_foreign_key :list_hierarchy_relationships, :list_items, column: child_id, primary_key: :id
    add_foreign_key :list_hierarchy_relationships, :list_items, column: :parent_id, primary_key: :id
    add_foreign_key :list_hierarchy_relationships, :list_items, column: :child_id, primary_key: :id

  end
end
