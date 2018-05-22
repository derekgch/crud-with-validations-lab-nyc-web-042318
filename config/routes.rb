Rails.application.routes.draw do

  resources :songs, only: [:index, :new, :show, :edit, :create]


end
