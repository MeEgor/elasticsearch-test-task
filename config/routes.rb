Rails.application.routes.draw do
  root 'goods#index'

  resources :goods, :only => [:new, :index, :create, :destroy]
end
