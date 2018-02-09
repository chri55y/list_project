Rails.application.routes.draw do

  get 'list_users/index'

  get 'list_users/show'

  get 'list_users/new'

  get 'list_users/edit'

  get 'list_users/delete'

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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
