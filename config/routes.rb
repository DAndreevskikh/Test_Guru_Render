Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true, except: :show
  end
end
