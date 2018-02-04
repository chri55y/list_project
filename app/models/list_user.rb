class ListUser < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :list_item

  # scopes


  # validations

end
