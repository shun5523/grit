Rails.application.routes.draw do

	namespace :admin do
		get 'top', to: 'top#top'
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :experiences, only: [:index, :show, :edit, :update, :destroy]
    resources :problems, only: [:index, :show, :edit, :update, :destroy]
	end

  namespace :user do
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :experiences, only: [:index, :show, :edit, :update, :destroy]
    resources :problems, only: [:index, :show, :edit, :update, :destroy]
  end

  resources :experiences  do
    resource :favorites, only: [:create, :destroy]
  end

  resources :problems do
    resource :comments, only: [:create, :destroy]
  end

  get 'top', to: 'top#top'



  devise_for :admins, :controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions'
  }
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
