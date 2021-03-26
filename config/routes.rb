Rails.application.routes.draw do
  # root 'images#index'
  resources :images do
    collection do
      get 'search'
    end
  end
end
