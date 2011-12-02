class ApplicationController < ActionController::Base
  protect_from_forgery       
  
  before_filter :authenticate_user! 
  
  layout :layout_by_resource   
  
  private
  def layout_by_resource
      if devise_controller?
       "admin/application"
      else
        "application"
      end
  end
   
  def after_sign_in_path_for(resource)
    
         admin_users_path
     
   
  end
end
