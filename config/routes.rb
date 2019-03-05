Rails.application.routes.draw do
  root 'shops#index'
  devise_for :users
  resources :shops do
    resources :categories, only: %i[create show]
    resources :products do
      collection do
        get :search
      end

    end
    collection do
      get :search
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
