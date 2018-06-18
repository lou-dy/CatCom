Rails.application.routes.draw do

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :male_betta do
    resources :comments
  end

  resources :users

  resources :orders, only: [:index, :show, :create, :destroy]

  root 'simple_pages#index'

  get 'simple_pages/about'

  get 'simple_pages/contact'

  get 'simple_pages/index'

  post 'simple_pages/thank_you'

  post 'payments/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
