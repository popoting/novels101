class NovelsController < ApplicationController
  before_action :find_novel, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :create]
  def index
    @novels = Novel.all
  end
  
  def new
    @novel = Novel.new
  end
  
  def create
    @novel = Novel.new(novel_params)
    @novel.user = current_user
    if @novel.save
      redirect_to @novel, notice: "Successfully Saved"
    else
      render 'new', notice: "Oh no,"
    end
  end
  
  def edit
  end
  
  def update
    if @novel.update(novel_params)
      redirect_to @novel, notice: "Successfully saved"
    
    else
      render 'edit'
    end
  end
  
  def show
  end
  
  def destroy
    @novel.destroy
    flash[:alert] = "Novel deleted"
    redirect_to novels_path
  end
  
  private
  
  def find_novel
    @novel = Novel.find(params[:id])
    if current_user != @novel.user
      redirect_to root_path, alert: "You have no permission"
    end
  end
  
  def novel_params
    params.require(:novel).permit(:title, :description, :author, :lead, :comment)
  end
end
