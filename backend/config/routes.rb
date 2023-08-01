Rails.application.routes.draw do

  resources :patients do
    resources :medications, except: [:show]
    resources :schedules, only: [:index] do
      post :update_confirmation, on: :collection
    end
  end
  # resources :medications, except: [:show]
  # resources :schedules, only: [:index]

  # post '/schedules/update_confirmation', to: 'schedules#update_confirmation'

  get 'rooms/show'
  get 'home/index'
  get 'home/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # ログアウト時にエラーが出るので、以下を追加
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
