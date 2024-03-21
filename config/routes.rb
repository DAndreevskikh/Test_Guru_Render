Rails.application.routes.draw do
  scope "(:lang)", lang: /#{I18n.available_locales.join("|")}/ do
    root 'tests#index'

    devise_for :users, path: :gurus, controllers: { sessions: 'sessions'},
               path_names: { sign_in: :log_in, sign_out: :log_out }

    resources :tests, only: :index do
      get :start, on: :member
    end

    resources :test_passages, only: %i[show update] do
      get :result, on: :member
      post :gist, on: :member
    end

    namespace :admin do
      resources :tests do
        resources :questions, shallow: true, except: :index do
          resources :answers, shallow: true, except: :index
        end
      end
      
      resources :gists, only: :index
    end
  end
end
