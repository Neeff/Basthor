Rails.application.routes.draw do
  resources :shops do
    member do
      
      #post 'category', to: 'categories#create',  as: 'create_category' 
    end
    resources :categories, only: %i[create]
    resources :products
  end 
  get 'category/:id', to: 'categories#show', as: 'show_products_category'
  devise_for :users
  root 'shops#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
