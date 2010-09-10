class User < ActiveRecord::Base
  
  acts_as_authentic
  has_and_belongs_to_many :roles
  has_many :tasks
    
  def role_symbols
    (roles || []).map {|r| r.title.downcase.to_sym}
  end
  
  def temp
    email =~ /.{32}@monotaskit\.com/
  end
    
end