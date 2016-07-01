Rails.application.routes.draw do
  get 'admin/index'

  devise_for :controllers => {registrations: 'registrations'}
  devise_for :users

  resources :instructors
  resources :activities
  resources :reviews
  resources :tags
  resources :through_ats
  resources :instructor_apps

  root 'welcome#index'
  get '/reviewapp', to: 'admin#reviewindividualapp'
  post '/reviewapp', to: 'admin#reviewindividualapp'
  post '/instructor_app' => "instructor_apps#create"
  get '/acceptedapps', to: 'admin#accept'
  get '/rejectedapps', to: 'admin#reject'
  get '/reviewapps', to: 'admin#reviewapps'
  get '/noapps', to: 'admin#noapps'



  # @instructor_intro = InstructorApp.all
  # @instructor_intro.each do |a|
  #   get '/instructor_profile/#{a}', to: 'welcome#instructor_profile'
  # end
  # get '/instructor_profile/:id', to: 'instructor_apps#activity'
  # get '/instructor_apps/new', to: 'instructor_apps#new'
  # get '/stories', to: 'welcome#stories'
  # get '/user_profile', to: 'welcome#user_profile'

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
