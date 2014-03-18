RmdTemplate::Application.routes.draw do
  # root :to => 'controller#index'
  # get  '/dashboard' => redirect('/')

  # scope :controller do
  #   match '/'                 => 'controller#index',      :as => :something1,		 :via => :GET
  #   match '/:id'              => 'controller#view',       :as => :something2,		 :via => :GET
  #   match '/:id/add'          => 'controller#add',        :as => :something3,		 :via => :GET
  #   match '/:id/add'          => 'controller#create',	    :as => :something4,	   :via => :POST
  # end

  devise_for :users,
    :skip       => [:registrations],
    :path       => '/user',
    :path_names => {
      sign_in:  '/login',
      sign_out: '/logout'
    } do
  end
end
