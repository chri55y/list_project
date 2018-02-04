class User < ApplicationRecord
  # associations
  has_many :linked_accounts

  has_many :list_users
  has_many :list_items, :through => :list_users

  # scopes


  # validations

end
