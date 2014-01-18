DataImporter::Application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :data_imports, except: [:edit]
  root 'data_imports#new'
end
