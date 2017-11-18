Rails.application.routes.draw do
  resources :reviews
  devise_for :users
  root "novels#index"
  resources :novels do
    collection do
  match 'search' => 'novels#search', via: [:get, :post], as: :search
end
  end
end
