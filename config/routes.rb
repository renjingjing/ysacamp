Rails.application.routes.draw do

  resources :classtimetables
  resources :kinds
  resources :course_resources
  resources :course_units
  resources :courses
  root 'homes#index'
  get({"/about" => "about#index"})
  resources :programs

  resources :users do
    resources :attendances
  end

  resources :attendancebooks
  get "/search_by_first_name/attendancebooks" => "attendancebooks#search_by_first_name"
  get "/to_day/attendancebooks" => "attendancebooks#to_day"

  resources :password_resets,only:[:new,:create,:edit,:update]

  resources :sessions, only: [:new, :create] do
    # this will create for us a route with DELETE http verb and /sessions
    # adding the on: :collection option will make it part of the routes for
    # sessions which means it won't prepend the routes with /sessions/:session_id
    delete :destroy, on: :collection
  end

  get "callbacks/index"
  get "/auth/twitter", as: :sign_in_with_twitter
  get "/auth/:provider/callback" => "callbacks#index"

  resources :contacts

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
