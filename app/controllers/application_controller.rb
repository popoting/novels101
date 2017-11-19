class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_filter :set_search
  
  def set_search
    @q = Novel.search(params[:q])
  end
  
  def require_is_admin
    if !current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end
  
  
end
