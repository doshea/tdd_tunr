TunrTdd::Application.routes.draw do
  resources :artists, only: [:index, :new, :edit, :show, :create]

end
