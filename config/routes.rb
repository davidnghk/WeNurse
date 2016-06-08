Rails.application.routes.draw do
  scope "(:locale)", locale: /en|zh/ do
	  resources :bookings
	  resources :locations
	  mount Upmin::Engine => '/admin'
	#  root to: 'visitors#index'
	  root to: 'visitors#stylishPortfolio'
	  devise_for :users
	  resources :users
	  #map.resources :bookings, :path_prefix => '/:locale'
	  #map.resources :locations, :path_prefix => '/:locale'
	  #map.resources :users, :path_prefix => '/:locale'
  end
  
end
