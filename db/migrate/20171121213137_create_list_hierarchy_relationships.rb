class CreateListHierarchyRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :list_hierarchy_relationships do |t|
      t.integer "parent_list_id"
      t.integer "child_list_id"

      t.boolean "active"

      t.integer "position"

      # custody issues
      t.boolean "primary_custody"



      t.timestamps
    end
  end
end
