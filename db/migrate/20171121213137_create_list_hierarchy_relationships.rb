class CreateListHierarchyRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :list_hierarchy_relationships do |t|
      t.integer "parent_item_id"
      t.integer "child_item_id"

      t.boolean "active"
      t.integer "status"
      t.integer "position"

      # custody issues
      t.boolean "primary_custody"

      # relationship specific content
      t.text "relationship_notes"


      t.timestamps
    end
  end
end
