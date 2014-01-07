Facturacion::Application.routes.draw do
  root 'admin/dashboard#show'

  devise_for :admins
  
  namespace :admin do
    get 'dashboard', to: 'dashboard#show'
    resources :bio_practices
    resources :bills do
      resources :orders
    end
  end

end
