Rails.application.routes.draw do
  # get 'applications/index'
  #
  # get 'applications/create'
  #
  # get 'applications/new'
  #
  # get 'applications/edit'
  #
  # get 'applications/show'
  #
  # get 'applications/update'
  #
  # get 'applications/destroy'
  #
  # get 'through_ats/index'
  #
  # get 'through_ats/create'
  #
  # get 'through_ats/new'
  #
  # get 'through_ats/edit'
  #
  # get 'through_ats/show'
  #
  # get 'through_ats/update'
  #
  # get 'through_ats/destroy'
  #
  # get 'tags/index'
  #
  # get 'tags/create'
  #
  # get 'tags/new'
  #
  # get 'tags/edit'
  #
  # get 'tags/show'
  #
  # get 'tags/update'
  #
  # get 'tags/destroy'
  #
  # get 'reviews/index'
  #
  # get 'reviews/create'
  #
  # get 'reviews/new'
  #
  # get 'reviews/edit'
  #
  # get 'reviews/show'
  #
  # get 'reviews/update'
  #
  # get 'reviews/destroy'
  #
  # get 'activities/index'
  #
  # get 'activities/create'
  #
  # get 'activities/new'
  #
  # get 'activities/edit'
  #
  # get 'activities/show'
  #
  # get 'activities/update'
  #
  # get 'activities/destroy'
  #
  # get 'instructors/index'
  #
  # get 'instructors/create'
  #
  # get 'instructors/new'
  #
  # get 'instructors/edit'
  #
  # get 'instructors/show'
  #
  # get 'instructors/update'
  #
  # get 'instructors/destroy'

  devise_for :controllers => {registrations: 'registrations'}
  devise_for :users

  resources :instructors
  resources :activities
  resources :reviews
  resources :tags
  resources :through_ats
  resources :applications

  root 'welcome#index'
  get: '/applications/new', to: 'applications/new'
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
