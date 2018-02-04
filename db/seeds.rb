User.create!([
                 {username: "MarthaAnne", first_name: "Martha", last_name: "Bogdon", email: "", password: nil},
                 {username: "WadyBug", first_name: "Wade", last_name: "Bogdon", email: "", password: nil}
             ])

LinkedAccount.create!([
  {user_id: 1}
])
ListItem.create!([
  {name: "feed okra"},
  {name: "open bag"},
  {name: "measure food with scoop"},
  {name: "pour food in bowl"},
  {name: "return scoop"},
  {name: "close bag"}
])
ListUser.create!([
  {list_item_id: 1, user_id: 2, permissions: nil},
  {list_item_id: 1, user_id: 1, permissions: nil}
])
