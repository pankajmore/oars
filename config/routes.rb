Oars::Application.routes.draw do
  devise_for :admins

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get  '/offered_courses/search', :to => 'offered_courses#search'
  get  '/courses/search', :to => 'courses#search'
  resources :courses
  resources :offered_courses
  resources :course_requests
  #resources :student/pre_registration
  
  #resources :registration_form do
 
  
  devise_for :faculties,
             :controllers => { :registrations => "faculty/registrations",
                             :sessions => "faculty/sessions" 
                             } do 
        get '/faculties/sign_up', :to => 'faculty/registrations#new', :as => :faculty_sign_up
        get '/faculties/sign_in', :to => 'faculty/sessions#new', :as => :faculty_sign_in
        get '/faculties/sign_out', :to => 'faculty/sessions#destroy', :as => :faculty_sign_out
        get '/faculties/instructor_home', :to => 'faculty#instructor_home', :as => :instructor_home
        get '/faculties/welcome_instructor', :to => 'faculty#welcome_instructor', :as => :welc_instructor
        get '/faculties/personal_info', :to => 'faculty#personal_info' , :as => :faculty_personal_info
        get '/faculties/account', :to => 'faculty#account' , :as => :faculty_account
        get '/faculties/current_registration', :to => 'faculty#current_registration' , :as => :current_registration
        get '/faculties/Pre_registration', :to => 'faculty#pre_registration' , :as => :faculty_pre_registration
        get '/faculties/courses_taken', :to => 'faculty#courses_taken' , :as => :faculty_courses_taken
        get '/faculties/course_requests', :to => 'faculty#course_requests' , :as => :course_list
        get '/faculties/course_info', :to => 'faculty#course_info' , :as => :course_info
        get '/faculties/accepted', :to => 'faculty#accepted' , :as => :accepted
        get '/faculties/rejected', :to => 'faculty#rejected' , :as => :rejected
        get '/faculties/registration_forms', :to => 'faculty/pre_registration#registration_forms' , :as => :registration_forms
        get '/faculties/approve_form', :to => 'faculty/pre_registration#approve_form' , :as => :approve_form
       
  end 

  post '/offered_courses/add', :to => 'offered_courses#add'
  post '/students/pre_registration/add', :to => 'student/pre_registration#add'

  post '/offered_courses/delete', :to => 'offered_courses#delete'
  post '/students/pre_registration/delete', :to => 'student/pre_registration#delete'

  post '/students/pre_registration/submit', :to => 'student/pre_registration#submit'
  post '/students/pre_registration/withdraw', :to => 'student/pre_registration#withdraw'
  get '/faculties/pre_registration/reject', :to => 'faculty/pre_registration#reject'
  get '/faculties/pre_registration/accept', :to => 'faculty/pre_registration#accept'  
  
  devise_for :students,
             :controllers => { :registrations => "student/registrations",
                             :sessions => "student/sessions"
                             } do 
        get '/students/sign_up', :to => 'student/registrations#new', :as => :student_sign_up
        get '/students/sign_in', :to => 'student/sessions#new', :as => :student_sign_in
        get '/students/sign_out', :to => 'student/sessions#destroy', :as => :student_sign_out
        get '/students/student_home', :to => 'student#student_home', :as => :student_home
        get '/students/welcome_student', :to => 'student#welcome_student', :as => :welc_student
        get '/students/personal_info', :to => 'student#personal_info', :as => :student_personal_info
        get '/students/current_registration', :to => 'student/current_registration#current_registration', :as => :student_current_registration
        get '/students/pre_registration', :to => 'student/pre_registration#index', :as => :student_pre_registration
        get '/students/add_drop', :to => 'student#add_drop', :as => :student_add_drop
        get '/students/transcript', :to => 'student#transcript', :as => :student_transcript
        get '/students/time_table', :to => 'student#time_table', :as => :student_time_table
        get '/students/backlog_list', :to => 'student#backlog_list', :as => :student_backlog_list
      	
  end

  root :to => "profile#login"

  get 'profile/login'
  get 'profile/contact', :to => 'profile#contact', :as => :contact
  
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
  # match ':controller(/:action(/:id))(.:format)'
end
