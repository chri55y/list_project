
User.create!([
  {username: "MarthaAnne", first_name: "Martha", last_name: "Bogdon", email: "", password: nil}
])
LinkedAccount.create!([
                          {user_id: 1}
                      ])