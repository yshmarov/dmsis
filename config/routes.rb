Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get 'home/index'
  resources :ideas do
    member do
      put "like", to: "ideas#upvote"
      put "dislike", to: "ideas#downvote"
    end
    get :fresh, :top, :mine, on: :collection
  end
  resources :comments
  resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
