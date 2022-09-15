Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #
  namespace :my do
    resources :presentations do
      resources :slides
    end
  end

  root "my/presentations#index"
end
