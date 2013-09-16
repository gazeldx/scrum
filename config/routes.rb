Scrum::Application.routes.draw do

  root :to => 'home#index'
  resources :news_and_events, only: [:index, :show]

  resources :messages


  resources :registers

  resources :trainers do
    member do
      get :up
      get :down
    end
    collection do
      get :team
    end
  end
  get 'team_member_:url' => 'trainers#show'
  get 'team' => 'trainers#team'

  resources :class_photos, :only => [:index, :create]
  get 'class_photos_:year' => 'class_photos#year'

  resources :courses do
    member do
      get 'register'
      get 'all'
    end
    #resources :class_photos
  end


  #match 'courses/:id/register' => 'courses#register'
  match 'course_register' => 'registers#new'
#  match 'registers/do_register' => 'registers#do_register'
  get 'admin/trainers' => 'trainers#background_index'
  get 'admin/courses' => 'courses#background_index'
  get 'admin/messages' => 'messages#index'
  get 'admin/registers' => 'registers#index'
  # get 'admin/class_photos' => 'class_photos#background_index'
  get 'admin' => 'registers#index'



  get 'about' => 'shared#about'
  get 'contact' => 'shared#contact'
  get 'partners' => 'shared#partners'
  #get 'students' => 'shared#students'

  get 'inner' => 'shared#inner'
  get 'library' => 'shared#library'

  get 'destroy_all_class_photos_:id' => 'courses#destroy_all_class_photos'

  #namespace :admin do
  #  # root :to => "registers#index"
  #
  #  resources :registers, :trainers
  #  resources :courses do
  #    # resources :class_photos, :controller => 'class_photos'
  #    resources :class_photos, :only => [:new, :create]
  #  end
  #end

  scope :path => "admin" do
    resources :registers, :trainers
    resources :courses do
      # resources :class_photos, :controller => 'class_photos'
      resources :class_photos, :only => [:new]
    end
  end

  namespace :admin do
    resources :news_and_events, except: :destroy do
      member { get :preview }
    end
    resources :course_descriptions
  end


  get 'notice' => 'shared#notice'
  get 'about/:url' => 'trainers#show'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  #match ':controller(/:action(/:id))(.:format)'
end
