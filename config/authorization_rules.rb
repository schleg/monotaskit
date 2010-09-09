authorization do

  role :guest do
    has_permission_on :users, :to => [:new, :create]
  end
  
  role :member do
    includes :guest
    has_permission_on :users, :to => [:show, :edit, :update]
  end

  role :administrator do
    includes :member
    has_permission_on :users, :to => [:index, :delete, :destroy, :show, :edit, :update]
  end

end