Rails.application.routes.draw do
  resources :candidates do
    member do
      post 'vote'
    end
  end

  namespace :admin do
    resources :candidates
  end

  root 'candidates#index'
end
