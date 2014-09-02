Etsydemo::Application.routes.draw do
  

  resources :questions do
    collection do
      post "create_question_comment"
    end
  end

  scope "(:locale)", locale: /en|ko|zh/ do
    
    resources :messages 

    resources :conversations do
      member do
        post :reply
        post 'trash'
      end
    end

    resources :tutorial_requests
    resources :disussion_forums
    
    devise_for :users, :controllers => { :registrations => "registrations" }
   
    resources :tutors do 
      collection do 
        get 'search'
      end

    resources :reviews, except: [:show, :index]
  end
  
    resources :enquiries do
    resources :proposals do
      post 'accept'
    end    
  end
    
  end




  get "pages/about"
  get "pages/contact"
  get 'accept' => "tutorial_request#2#proposals#new"


  get 'tutorspage' => "tutorial_requests#tutors"
  get 'studentspage' => "tutorial_requests#students"

  get "pages/inbox"

  get "pages/resources"
  get "pages/personal_statements"
  get "pages/college_essays"
  get "pages/oxbridge_interview_questions"
  get "pages/suggested_readings"
  get "pages/exams"
  get "pages/university_entrance"
  get "pages/languages"
  get "pages/online_tuition"
  get "pages/services_for_schools"
  get "pages/our_tutors"
  get "pages/book_a_tutorial"
  get "pages/how_it_works"
  get "pages/terms_and_conditions"
  

  root 'pages#index'
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
