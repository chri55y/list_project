class ListItem < ApplicationRecord
  # associations
  has_many :list_users
  has_many :users, :through => :list_users

  # reference: https://medium.com/@jbmilgrom/active-record-many-to-many-self-join-table-e0992c27c1e
  # has_many :parents, through: :child_of_parents , source: :parent
  # has_many :child_of_parents, foreign_key: :child_id, class_name: "ListHierarchyRelationship"
  # has_many :parents, through: :parent_list_hierarchy_relationships , source: :parent
  # has_many :parent_list_hierarchy_relationships, foreign_key: :child_id, class_name: "ListHierarchyRelationship"
  # has_many :parents, :through => :child_of_parents , :source => :parent
  # has_many :child_of_parents, :foreign_key => :child_id, :class_name => "ListHierarchyRelationship"
  has_many :parents, :through => :list_hierarchy_relationships , :source => :parent
  has_many :list_hierarchy_relationships, :foreign_key => :child_id, :class_name => "ListHierarchyRelationship"

  # has_many :children, through: :parent_of_children, source: :child
  # has_many :parent_of_children, foreign_key: :parent_id, class_name: "ListHierarchyRelationship"
  # has_many :children, :through =>  :parent_of_children, :source => :child
  # has_many :parent_of_children, :foreign_key => :parent_id, :class_name => "ListHierarchyRelationship"
  has_many :children, :through =>  :list_hierarchy_relationships, :source => :child
  has_many :list_hierarchy_relationships, :foreign_key => :parent_id, :class_name => "ListHierarchyRelationship"

  # attachments


  # has_many :list_hierarchy_relationships, foreign_key: :parent_id
  # has_many :list_hierarchy_relationships, foreign_key: :child_id



  # validations

end
