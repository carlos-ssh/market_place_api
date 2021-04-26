Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      #get 'tokens/create'
      resources :tokens, only: %i[create]
    end
  end

  # API definition
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # We are going to list our resources here.
      resources :users, only: %i[show create update destroy]
    end
  end
end
