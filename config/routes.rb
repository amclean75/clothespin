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
		resources :brands, only:[:destroy]
	end
	resources :images do 
		member do 
			post "/like", to: "images#like"
			delete "/like", to: "images#unlike"
		end
		resources :items, only:[:destroy]
		resources :comments, only:[:create, :destroy]		
	end
	get "/profile", to: "users#profile"
	get "/profile/:username", to: "users#show", as: "profile_user"
	get "/featured", to: "images#featured"
	post "/images/:image_id", to: "items#create", as: "image_items"
	post "/users/:user_id", to: "brands#create", as: "user_brands"	

	root "users#profile"

end