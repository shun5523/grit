Rails.application.routes.draw do

	namespace :admin do
		get 'top', to: 'top#top'
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :experiences, only: [:index, :show, :edit, :update, :destroy]
    resources :problems, only: [:index, :show, :edit, :update, :destroy]
	end

  namespace :user do
    resources :experiences, only: [:index, :show, :edit, :update, :destroy]
    resources :problems, only: [:index, :show, :edit, :update, :destroy]
    resources :users, only: [:show, :edit, :update, :destroy]
  end

  resources :experiences  do
    resource :favorites, only: [:create, :destroy]
  end

  resources :problems do
    resources :comments, only: [:create, :destroy]
  end

  get 'top', to: 'top#top'
  root to: 'top#top'



  devise_for :admins, :controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions'
  }
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

   devise_scope :admin do
    get "admins/sign_in", :to => "admins/sessions#new"
    get "admins/sign_out", :to => "admins/sessions#destroy"
  end

  devise_scope :user do
    get "users/sign_in", :to => "users/sessions#new"
    get "users/sign_out", :to => "users/sessions#destroy"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
