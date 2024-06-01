Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/scraper', to: 'scraper#create'
  get '/scraper/:id', to: 'scraper#show'

  resources :products, only: [:index, :show] do
    collection do
      get :search
    end
  end
end
