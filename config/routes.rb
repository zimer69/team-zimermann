# config/routes.rb
Rails.application.routes.draw do
  get "landing/index"
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'landing#index'

  # Athlete area
  namespace :athlete do
    get "profiles/show"
    get "profiles/edit"
    get "profiles/update"
    get "dashboard/index"
    root 'dashboard#index'
    resource :profile, only: [:show, :edit, :update]
    resources :subscriptions, only: [:index, :show]
  end

  # Admin area
  namespace :admin do
    get "plans/index"
    get "plans/show"
    get "plans/new"
    get "plans/create"
    get "plans/edit"
    get "plans/update"
    get "plans/destroy"
    get "users/index"
    get "users/show"
    get "users/edit"
    get "users/update"
    root 'dashboard#index'
    resources :users do
      member do
        patch :toggle_role
        patch :block_subscription
        patch :unblock_subscription
      end
    end
    resources :plans
  end
end