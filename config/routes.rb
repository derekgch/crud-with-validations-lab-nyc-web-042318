Rails.application.routes.draw do

  resources :songs, only: [:index, :new, :show, :edit, :create, :destroy]
  patch 'songs/:id', to: 'songs#update'

end
