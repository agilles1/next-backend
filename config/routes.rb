Rails.application.routes.draw do
  resources :audition_rooms
  # resources :rooms
  namespace :api do
    namespace :v1 do

      resources :candidates
      
      resources :auditions do
        resources :candidates
      end

    end
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
