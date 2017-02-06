Rails.application.routes.draw do

  root to: 'landings#index'

  post 'change_locale/:lng' => 'landings#change_locale', as: :change_language

  resources :rentals, except: :destroy do
    patch 'end/:fine' => 'rentals#end', as: :end, on: :member
    collection do
      get 'total'
      get 'search'
    end
  end

  resources :boxes, only: :index do
    resources :rentals, only: :new
  end

end
