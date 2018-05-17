Rails.application.routes.draw do
  resources :idea_tags
  resources :tags
  devise_for :users
  root to: "home#index"
  get 'home/index'
  resources :ideas do
    get :fresh, :top, :mine, on: :collection
    member do
      put "like", to: "ideas#upvote"
      put "dislike", to: "ideas#downvote"
    end
  end
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
