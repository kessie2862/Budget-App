Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }
  get 'categories/home', to: 'categories#home', as: 'categories_home'


  authenticated :user do
    root 'categories#home', as: :authenticated_root
  end

  unauthenticated do
    root 'categories#index', as: :unauthenticated_root
  end

  resources :categories, only: %i[index home new create destroy] do
    get :home, on: :collection
    resources :transactions, only: %i[index new create]
  end
end
