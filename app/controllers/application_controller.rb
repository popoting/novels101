class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_filter :set_search
  
  def set_search
    @q = Novel.search(params[:q])
  end
end
