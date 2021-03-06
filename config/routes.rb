Rails.application.routes.draw do
  get 'schedule/index'

  get 'admin/index'

  devise_for :users, :controllers => {registrations: 'users/registrations'}

  resources :users # this is the worst

  resources :instructors
  resources :activities
  resources :reviews
  resources :tags
  resources :through_ats
  resources :instructor_apps

  root 'welcome#index'
  get '/reviewapp/:id', to: 'admin#reviewindividualapp'
  post '/reviewapp/:id', to: 'admin#reviewindividualapp'
  post '/instructor_app', to: "instructor_apps#create"
  get '/applicationworkflow/:id', to: "instructor_apps#workflow"
  get '/accept/:id', to: 'admin#accept'
  get '/reject/:id', to: 'admin#reject'
  get '/reviewapps', to: 'admin#reviewapps'
  get '/noapps', to: 'admin#noapps'
  get '/apps_under_review', to: 'admin#being_reviewed'
  get '/individualinstructor/:id', to: 'instructors#individualinstructor'
  get '/filter/:category', to: 'instructors#filter'
  get '/acceptedapps', to: 'admin#acceptedapps'
  get '/rejectedapps', to: 'admin#rejectedapps'
  get '/activity/:activity_id/review/new', to: 'reviews#new'
  post '/activity/:activity_id/review/new', to: 'reviews#new'
  get '/:instructor_id/activity/new', to: 'activities#new'
  get '/activity/:activity_id/signup', to: 'schedule#index'
  post '/activity/:activity_id/signup', to: 'schedule#create'
  get '/instructor/new', to: 'instructors#new'

  get '/contact_us' => 'contact_info#index'
  post '/contact_us' => 'contact_info#index'

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
