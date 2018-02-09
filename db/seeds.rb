User.create!([
  {id: 1, username: "MarthaAnne", first_name: "Martha", last_name: "Bogdon", email: "", password: nil},
  {id: 2, username: "WadyBug", first_name: "Wade", last_name: "Bogdon", email: "", password: nil}
])
ListItem.create!([
  {id: 1, name: "feed okra"},
  {id: 2, name: "open bag"},
  {id: 3, name: "measure food with scoop"},
  {id: 4, name: "pour food in bowl"},
  {id: 5, name: "return scoop"},
  {id: 6, name: "close bag"},
  {id: 7, name: "Martha's Morning Routine"},
  {id: 8, name: "Wade's Morning Checklist"}
])
ListHierarchyRelationship.create!([
  {id: 1, parent_id: 1, child_id: 2, active: nil, status: nil, position: 1, primary_custody: nil, relationship_notes: nil},
  {id: 2, parent_id: 1, child_id: 3, active: nil, status: nil, position: 2, primary_custody: nil, relationship_notes: nil},
  {id: 3, parent_id: 1, child_id: 4, active: nil, status: nil, position: 3, primary_custody: nil, relationship_notes: nil},
  {id: 4, parent_id: 1, child_id: 5, active: nil, status: nil, position: 4, primary_custody: nil, relationship_notes: nil},
  {id: 5, parent_id: 1, child_id: 6, active: nil, status: nil, position: 5, primary_custody: nil, relationship_notes: nil},
  {id: 6, parent_id: 7, child_id: 1, active: nil, status: nil, position: nil, primary_custody: nil, relationship_notes: nil},
  {id: 7, parent_id: 8, child_id: 1, active: nil, status: nil, position: nil, primary_custody: nil, relationship_notes: nil}
])
ListUser.create!([
  {id: 1, list_item_id: 1, user_id: 2, permissions: nil},
  {id: 2, list_item_id: 1, user_id: 1, permissions: nil},
  {id: 3, list_item_id: 7, user_id: 1, permissions: nil},
  {id: 4, list_item_id: 8, user_id: 2, permissions: nil}
])
LinkedAccount.create!([
  {id: 1, user_id: 1}
])
