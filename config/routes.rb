Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #
  namespace :my do
    resources :presentations, only: %i[new show update create destroy]
    resources :slideshows do
      resources :slides do
        member do
          patch :move
        end
      end
    end
  end

  resources :presentations, only: %i[index show] do
    member do
      get :archived
    end
    resources :chat_messages
    resources :attendees, only: %i[update create destroy]
  end

  root 'home#index'
end
