Rails.application.routes.draw do
  resources :candidate_rooms
  resources :rooms
  resources :candidates
  resources :auditions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
