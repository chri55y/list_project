Rails.application.routes.draw do

  get 'list_hierarchy_relationships/index'

  get 'list_hierarchy_relationships/show'

  get 'list_hierarchy_relationships/new'

  get 'list_hierarchy_relationships/edit'

  get 'list_hierarchy_relationships/delete'

  resources :users do
    member do
      get :delete
    end
  end

  resources :list_items do
    member do
      get :delete
    end
  end

  resources :list_users do
    member do
      get :delete
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
