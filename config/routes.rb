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
	resources :images do 
		member do 
			post "/like", to: "images#like"
			post "unlike", to: "images#unlike"
		end
		resources :items, only:[:create, :destroy]		
		resources :comments, only:[:create, :destroy]
		
	end
		get "/profile", to: "users#profile"
		get "/profile/:username", to: "users#show", as: "profile_user"
		
		
	root "users#profile"

end