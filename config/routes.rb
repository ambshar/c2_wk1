PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/pin', to: 'sessions#pin'
  post '/pin', to: 'sessions#pin'

  resources :posts, except: [:destroy] do
    resources :comments, only: [:create, :edit, :update] do
      member do
        post :vote  #post is the http verb
      end
    end

    member do  #the member block generates vote action for each post id - dynamic
      post :vote  #write the http verb followed by action.  Here it is 'post'.  POST posts/:id/vote  
    end           #this is requested when voting on a post calls on posts#vote

    #GET posts/archives.  This is an example to generate routes using collection
    #collection do  (No dynamic element)
      # get :archives  GET posts/archives
    #end


  end
  resources :categories, only: [:new, :create, :show]

  resources :users, only: [:create, :show, :edit, :update]

 

end
