Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true, only: %i[new create show edit update destroy]
  end
end
