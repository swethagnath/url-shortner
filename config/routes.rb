Rails.application.routes.draw do
  root "url_generators#index"
  devise_for :users
  resources :url_generators
  get '/:encoded_url', to:'url_generators#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
