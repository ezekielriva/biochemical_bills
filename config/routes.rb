Facturacion::Application.routes.draw do
  root 'admin/dashboard#show'

  devise_for :admins
  
  namespace :admin do
    get 'dashboard', to: 'dashboard#show'
    resources :bio_practices, path: 'practicas_bioquimicas'
    resources :bills, path: 'facturacion' do
      resources :orders, path: 'ordenes'
    end
  end

end
