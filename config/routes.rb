Rails.application.routes.draw do
  root "proponents#index"

  resources :proponents
end
