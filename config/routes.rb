Rails.application.routes.draw do
  root "proponents#index"

  resources :proponents do
    resources :phone_numbers, only: %i[new create destroy]
  end
end
