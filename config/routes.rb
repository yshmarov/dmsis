Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "ideas#top"
  get 'terms_of_service', to: 'static_pages#terms_of_service'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'contacts', to: 'static_pages#contacts'
  resources :ideas do
    member do
      patch :publish
      patch :unpublish
      put "like", to: "ideas#upvote"
      put "dislike", to: "ideas#downvote"
    end
    get :fresh, :top, :my, :random, :unvoted, :upvoted, :cofounding, :trending, on: :collection
  end
  resources :comments
  resources :attachments
  resources :cofounders
  resources :tags, only: [:show, :index, :destroy]
  resources :users, only: [:show, :index]
end
