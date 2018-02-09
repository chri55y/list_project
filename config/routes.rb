Rails.application.routes.draw do

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
