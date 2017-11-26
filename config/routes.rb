Rails.application.routes.draw do
  namespace :admin do
    resources :novels
  end
  resources :reviews
  devise_for :users
  root "novels#index"
  resources :novels do
    collection do
  match 'search' => 'novels#search', via: [:get, :post], as: :search
end
  end
  resources :tags, only: [:index, :show]
end
