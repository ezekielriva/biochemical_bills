Facturacion::Application.routes.draw do
  root 'welcome#index'

  namespace :admin do
    resources :bills
  end
end
