class CreateListHierarchyRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :list_hierarchy_relationships do |t|

      t.timestamps
    end
  end
end
