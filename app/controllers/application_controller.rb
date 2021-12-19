class ApplicationController < ActionController::Base
  include SessionsHelper
  include Pagy::Backend
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
     end
  end

  
  def counts(user)
    @count_schedules = user.schedules.count
  end
end
