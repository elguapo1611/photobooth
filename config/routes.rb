Photobooth::Application.routes.draw do
  resources :photos, :only => [:index, :create]
  root 'photos#index'
end
