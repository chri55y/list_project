class ListItem < ApplicationRecord
  # associations
  has_many :list_users
  has_many :users, :through => :list_users

  # scopes


  # validations

end
