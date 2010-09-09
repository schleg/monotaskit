class User < ActiveRecord::Base
  
  acts_as_authentic
  has_and_belongs_to_many :roles
    
  def role_symbols
    (roles || []).map {|r| r.title.downcase.to_sym}
  end
    
end