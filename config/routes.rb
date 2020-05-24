Rails.application.routes.draw do
  root 'pages#index'
  resources :models
  resources :test, only:[:index] do
    collection do
      get :result
      post :calculate
      get :upload
    end
  end
  resources :pages, only: [:create]
  resources :upload do
    collection do
      post :upload
    end
  end
  resource :setting, only: %i[show update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
