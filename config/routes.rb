Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root :to => "notice#first"
	get "/login" => "notice#login"
	post "/login" => "notice#login"
	get "/home" => "notice#home"
	post "/home" => "notice#home"
	post "/judge" => "notice#judge"
	get "/index" => "notice#index"
	post "/create" => "notice#create"
	get "/update/:postId" => "notice#update"
	post "/update_action" => "notice#update_action"
	get "/read/:postId" => "notice#read"
	get "/delete/:postId" => "notice#delete"
end
