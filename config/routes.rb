Rails.application.routes.draw do
  root 'pages#index'
  resources :models ,only:[:new,:create,:show,:index]
  resources :test, only:[:index] do
    collection do
      get :result
      post :calculate
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
