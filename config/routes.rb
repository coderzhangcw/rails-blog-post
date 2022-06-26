Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get '/', to: 'home#index'

  namespace :api do
    namespace :v1 do
      # resources :article, only: [:create, :get, :update]
      resources :article
      resources :tag
    end
  end

end
