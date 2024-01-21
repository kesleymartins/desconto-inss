Rails.application.routes.draw do
  root "proponents#index"

  resources :proponents do
    resources :phone_numbers, only: %i[new create destroy]

    member do
      patch 'update_salary'
    end

    collection do
      get 'report'
    end
  end

  get 'salaries/calculate-discount', to: 'salaries#calculate_discount'
end
