TunrTdd::Application.routes.draw do
  root to: 'home#index'
  resources :artists
end
