Rails.application.routes.draw do
  root "proponents#index"

  resources :proponents do
    resources :phone_numbers, only: %i[new create destroy]

    collection do
      get 'report'
    end
  end

  get 'salaries/calculate-discount', to: 'salaries#calculate_discount'
end
