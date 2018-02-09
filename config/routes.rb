Rails.application.routes.draw do

  get 'list_items/index,'

  get 'list_items/show,'

  get 'list_items/new,'

  get 'list_items/edit,'

  get 'list_items/delete'

  resources :users do
    member do
      get :delete
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
