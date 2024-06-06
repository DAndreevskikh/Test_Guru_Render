Rails.application.routes.draw do
  scope '(:lang)', lang: /#{I18n.available_locales.join('|')}/ do
    root 'tests#index'

    devise_for :users, path: :gurus, controllers: { sessions: 'sessions' },
               path_names: { sign_in: 'log_in', sign_out: 'log_out' }

    resources :tests, only: :index do
      member do
        get :start
      end
    end

    resources :feedbacks, only: [:new, :create]

    resources :test_passages, only: [:show, :update] do
      member do
        get :result
      end
      resources :gists, only: :create
    end

    resources :user_badges, only: :index

    namespace :admin do
      resources :gists, only: :index
      resources :badges
      resources :tests do
        member do
          patch :update_inline
        end
        resources :questions, shallow: true, except: :index do
          resources :answers, shallow: true, except: :index
        end
      end
    end
  end
end
