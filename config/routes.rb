Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #
  namespace :my do
    resources :presentations, only: [:new, :show, :update, :create, :destroy]
    resources :slideshows do
      resources :slides do
        member do
          patch :move
        end
      end
    end
  end

  resources :presentations, only: [ :index, :show ] do
    resources :chat_messages
    resources :attendees, only: [ :create, :destroy ]
  end

  root "my/slideshows#index"

end
