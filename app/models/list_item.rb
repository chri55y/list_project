class ListItem < ApplicationRecord
  # associations
  has_many :list_users
  has_many :users, :through => :list_users

  # LHR association scratch work
  # reference: https://medium.com/@jbmilgrom/active-record-many-to-many-self-join-table-e0992c27c1e
  # par, chi = ListItem.find(1,2)
  # par.children  par.parents   chi.parents chi.children
  #   CHI         null          PAR         null

  # # ***************************************************************************
  # # # par.children =>  null   ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`child_id` = 1
  # # # par.parents  =>  null*  ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`child_id` = 1
  # # # chi.parents  =>  PAR*   ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`child_id` = 2
  # # # chi.children =>  self   ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`child_id` = 2
  # has_many :list_hierarchy_relationships, :foreign_key => :parent_id, :class_name => "ListHierarchyRelationship"
  # has_many :parents, :through => :list_hierarchy_relationships , :source => :parent
  # has_many :list_hierarchy_relationships, :foreign_key => :child_id, :class_name => "ListHierarchyRelationship"
  # has_many :children, :through =>  :list_hierarchy_relationships, :source => :child
  # # ***************************************************************************

  #
  # # par.children =>  CHI*   ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`parent_id` = 1
  # # par.parents  =>  null*  ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`child_id` = 1
  # # chi.parents  =>  PAR*   ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`child_id` = 2
  # # chi.children =>  null*  ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`parent_id` = 2
  has_many :is_child_relationships, :foreign_key => :child_id, :class_name => "ListHierarchyRelationship"
  has_many :parents, :through => :is_child_relationships , :source => :parent
  has_many :is_parent_relationships, :foreign_key => :parent_id, :class_name => "ListHierarchyRelationship"
  has_many :children, :through =>  :is_parent_relationships, :source => :child

  # LHR association scratch work
=begin
  # switch order of declaration (would expect to make .children work)
  # => yes: worked as expected
  # # # par.children =>  CHI*   ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`parent_id` = 1
  # # # par.parents  =>  self   ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`parent_id` = 1
  # # # chi.parents  =>  null   ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`parent_id` = 2
  # # # chi.children =>  null* ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`parent_id` = 2
  # has_many :list_hierarchy_relationships, :foreign_key => :child_id, :class_name => "ListHierarchyRelationship"
  # has_many :children, :through =>  :list_hierarchy_relationships, :source => :child
  # has_many :list_hierarchy_relationships, :foreign_key => :parent_id, :class_name => "ListHierarchyRelationship"
  # has_many :parents, :through => :list_hierarchy_relationships , :source => :parent


  # # use both :list_hierarchy_relationships, change from source notation to inverse_of
  # # => same with or w/o :inverse_of in LHR model
  # # par.children =>  InverseOfAssociationNotFoundError: Could not find the inverse association for children (:child in ListItem)
  # # par.parents  =>  InverseOfAssociationNotFoundError: Could not find the inverse association for parents (:parent in ListItem)
  # # chi.parents  =>  //
  # # chi.children =>  //
  # has_many :list_hierarchy_relationships, :foreign_key => :parent_id, :class_name => "ListHierarchyRelationship"
  # has_many :parents, :through => :list_hierarchy_relationships , :inverse_of => :parent
  # has_many :list_hierarchy_relationships, :foreign_key => :child_id, :class_name => "ListHierarchyRelationship"
  # has_many :children, :through =>  :list_hierarchy_relationships, :inverse_of => :child

  # # no use of :list_hierarchy_relationships
  # # par.children =>  null   ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`child_id` = 1
  # # par.parents  =>  self   ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`parent_id` = 1
  # # chi.parents  =>  null   ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`parent_id` = 2
  # # chi.children =>  self   ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`child_id` = 2
  # has_many :parent_relationships, :foreign_key => :parent_id, :class_name => "ListHierarchyRelationship"
  # has_many :parents, :through => :parent_relationships , :source => :parent
  # has_many :child_relationships, :foreign_key => :child_id, :class_name => "ListHierarchyRelationship"
  # has_many :children, :through =>  :child_relationships, :source => :child

  # # 1 use of :list_hierarchy_relationships, on :parent_id
  # # par.children =>  CHI*   ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`parent_id` = 1
  # # par.parents  =>  self   ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`parent_id` = 1
  # # chi.parents  =>  null   ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`parent_id` = 2
  # # chi.children =>  null* ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`parent_id` = 2
  # has_many :list_hierarchy_relationships, :foreign_key => :parent_id, :class_name => "ListHierarchyRelationship"
  # has_many :parents, :through => :list_hierarchy_relationships , :source => :parent
  # # has_many :list_hierarchy_relationships, :foreign_key => :child_id, :class_name => "ListHierarchyRelationship"
  # has_many :children, :through =>  :list_hierarchy_relationships, :source => :child

  # # par.children =>  null   ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`child_id` = 1
  # # par.parents  =>  null*  ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`child_id` = 1
  # # chi.parents  =>  PAR*   ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`child_id` = 2
  # # chi.children =>  self   ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`child_id` = 2
  # has_many :list_hierarchy_relationships, :foreign_key => :parent_id, :class_name => "ListHierarchyRelationship"
  # has_many :parents, :through => :list_hierarchy_relationships , :source => :parent
  # has_many :list_hierarchy_relationships, :foreign_key => :child_id, :class_name => "ListHierarchyRelationship"
  # has_many :children, :through =>  :list_hierarchy_relationships, :source => :child

  # # par.children =>  null   ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`child_id` = 1
  # # par.parents  =>  self   ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`parent_id` = 1
  # # chi.parents  =>  null   ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`parent_id` = 2
  # # chi.children =>  self   ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`child_id` = 2
  # has_many :parental_figures, :foreign_key => :parent_id, :class_name => "ListHierarchyRelationship"
  # has_many :parents, :through => :parental_figures , :source => :parent
  # has_many :list_hierarchy_relationships, :foreign_key => :child_id, :class_name => "ListHierarchyRelationship"
  # has_many :children, :through => :list_hierarchy_relationships, :source => :child

  # # this association works, but in the opposite direction
  # has_many :list_hierarchy_relationships, :foreign_key => :child_id, :class_name => "ListHierarchyRelationship"
  # has_many :parents, :through => :list_hierarchy_relationships , :source => :parent
  #
  # has_many :list_hierarchy_relationships, :foreign_key => :parent_id, :class_name => "ListHierarchyRelationship"
  # has_many :children, :through =>  :list_hierarchy_relationships, :source => :child

  # # par.children  par.parents   chi.parents chi.children
  # #   null        null          PARENT      self
  # par.children =>  null   ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`child_id` = 1
  # par.parents  =>  null   ON `list_items`.`id` = `LHR`.`child_id` WHERE `LHR`.`child_id` = 1
  # chi.parents  =>  PAR*   ON `list_items`.`id` = `LHR`.`parent_id` WHERE `LHR`.`child_id` = 2
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
  # has_many :list_hierarchy_relationships, :foreign_key => :parent_id, :class_name => "ListHierarchyRelationship"
  # has_many :parents, :through => :list_hierarchy_relationships , :source => :parent
  # has_many :parental_relationships, :foreign_key => :child_id, :class_name => "ListHierarchyRelationship"
  # has_many :children, :through =>  :parental_relationships, :source => :child


=end


  # attachments --> TO DO later


  # scopes



  # validations

end
