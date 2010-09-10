ActionController::Routing::Routes.draw do |map|
  map.resource :account, :controller => "users"
  map.resources :users, :member => { :delete => :get }
  map.resource :user_session
  map.root :controller => "tasks", :action => "index"
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.resources :tasks, :member => { :start => :get, :stop => :get }
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end