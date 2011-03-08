Project2::Application.routes.draw do

	match "pages/login", :via => [:get,:post]
	match "pages/continue" => "pages#continue"
	get "pages/logout"
	root :to => "pages#login"

  get "users/new"
	match "users/create" => "users#create"
	match "users/chooseUser" => "users#chooseUser"
	match "users/edit" => "users#edit"
	match "users/update" => "users#update"
  get "users/edit"

  get "users/index"

	get "suggestions/new"
	match "suggestions/create" => "suggestions#create"
	  
	get "user_suggestions/new"
	match "user_suggestions/create" => "user_suggestions#create"
	match "user_suggestions/chooseSuggestion" => "user_suggestions#chooseSuggestion"
  match "user_suggestions/edit" => "user_suggestions#edit"
	match "user_suggestions/update" => "user_suggestions#update"
	get "user_suggestions/edit"

	get "user_suggestions/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
