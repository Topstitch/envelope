Rails.application.routes.draw do
  resources :correspondences
  resources :labels
  resources :lists
  resources :addresses
  resources :contacts
  resources :households
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
