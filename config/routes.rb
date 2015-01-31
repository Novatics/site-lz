SiteLZ::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  get '/usuarios/minha-conta' => 'settings#edit', as: :edit_user
  put '/usuarios'             => 'settings#update', as: :update_user
  
  root  to:                      'home#index'
  get 'contato'               => 'contacts#index', as: :contacts
  get 'contato/enviar'        => 'contacts#new',   as: :new_contact

  get 'frontend/:template'    => 'frontend#show'
  get 'frontend'              => 'frontend#index'

  get 'projetos'              => 'projects#index'
  get 'projetos/:name'        => 'projects#show'
  get 'clientes/:name'        => 'clients#index', as: :clients
  
  get ':slug'                 => 'pages#show',     as: :page
end
