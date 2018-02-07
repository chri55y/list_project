class ListItem < ApplicationRecord
  # associations
  has_many :list_users
  has_many :users, :through => :list_users

  # reference: https://medium.com/@jbmilgrom/active-record-many-to-many-self-join-table-e0992c27c1e
  # par, chi = ListItem.find(1,2)
  # par.children  par.parents   chi.parents chi.children
  #   CHI         null          PAR         null

  # # this association works, but in the opposite direction
  # has_many :list_hierarchy_relationships, :foreign_key => :child_id, :class_name => "ListHierarchyRelationship"
  # has_many :parents, :through => :list_hierarchy_relationships , :source => :parent
  #
  # has_many :list_hierarchy_relationships, :foreign_key => :parent_id, :class_name => "ListHierarchyRelationship"
  # has_many :children, :through =>  :list_hierarchy_relationships, :source => :child

  # # par.children  par.parents   chi.parents chi.children
  # #   null        null          PARENT      self
  # par.children =>  null   ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`child_id` = 1
  # par.parents  =>  self   ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`child_id` = 1
  # chi.parents  =>  null   ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`child_id` = 2
  # chi.children =>  self   ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`child_id` = 2
  # has_many :list_hierarchy_relationships, :foreign_key => :parent_id, :class_name => "ListHierarchyRelationship"
  # has_many :parents, :through => :list_hierarchy_relationships , :source => :parent
  #
  # has_many :list_hierarchy_relationships, :foreign_key => :child_id, :class_name => "ListHierarchyRelationship"
  # has_many :children, :through =>  :list_hierarchy_relationships, :source => :child


  # par.children =>  null   ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`child_id` = 1
  # par.parents  =>  self   ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`parent_id` = 1
  # chi.parents  =>  null   ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`parent_id` = 2
  # chi.children =>  self   ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`child_id` = 2
  has_many :list_hierarchy_relationships, :foreign_key => :parent_id, :class_name => "ListHierarchyRelationship"
  has_many :parents, :through => :list_hierarchy_relationships , :source => :parent

  has_many :parental_relationships, :foreign_key => :child_id, :class_name => "ListHierarchyRelationship"
  has_many :children, :through =>  :parental_relationships, :source => :child

  # attachments





  # validations

end
