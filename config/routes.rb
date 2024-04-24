Rails.application.routes.draw do
  scope '(:lang)', lang: /#{I18n.available_locales.join('|')}/ do
    root 'tests#index'
    devise_for :users, path: :gurus, controllers: { sessions: 'sessions' }, 
               path_names: { sign_in: :log_in, sign_out: :log_out }
    resources :tests, only: :index do
      get :start, on: :member
    end

    get 'feedback', to: 'feedbacks#new', as: :new_feedback
    post 'feedback', to: 'feedbacks#create', as: :feedbacks 

    resources :test_passages, only: %i[show update] do
      get :result, on: :member
      resources :gists, only: :create
    end

    namespace :admin do
      resources :gists, only: :index
      resources :tests do
        patch :update_inline, on: :member

        resources :questions, shallow: true, except: :index do
          resources :answers, shallow: true, except: :index
        end
      end
    end
  end
end
