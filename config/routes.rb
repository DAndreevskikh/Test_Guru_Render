Rails.application.routes.draw do
  get 'about', to: 'static#about'
  get '/about/author', to: 'static#about_author'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
