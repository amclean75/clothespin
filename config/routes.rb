Rails.application.routes.draw do 
	
	devise_for :users
		get "/login", to: "sessions#new"
		post "/sessions", to: "sessions#create"
		delete "/sessions", to: "sessions#destroy"
		
	resources :users, only: [:new, :index, :create] do 
		member do 
		post "/follow", to: "users#follow"
		post "/unfollow", to: "users#unfollow"
	end 
end
	resources :images
		get "/profile", to: "users#profile"
		get "/profile/:username", to: "users#show", as: "profile_user"
		
		
	root "users#new"
end
