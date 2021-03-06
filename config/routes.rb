Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  resources :users do
    member do
      get 'summary'
    end
  end
  resources :questions
  resources :answers
end
