Rails.application.routes.draw do
  root 'upload#index'
  resources :upload do
    collection do
      post :upload
    end
  end
  resource :setting, only: %i[show update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
