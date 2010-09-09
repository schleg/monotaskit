module UsersHelper
  
  def get_update_url(user)
    if current_user.id == user.id
      account_path
    end
    user_path user
  end
  
end
