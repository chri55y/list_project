class ListHierarchyRelationship < ApplicationRecord
  # associations
  # belongs_to :parent , foreign_key: "parent_id", class_name: "ListItem"
  # belongs_to :child , foreign_key: "child_id", class_name: "ListItem"
  belongs_to :parent , :foreign_key => :parent_id, :class_name => "ListItem"
  belongs_to :child , :foreign_key => :child_id, :class_name => "ListItem"

  # scopes


  # validations


end
