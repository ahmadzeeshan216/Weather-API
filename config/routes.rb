Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :weather, only: [] do
    collection do
      post :temperature
      post :wind
      post :clouds
    end
  end
end
