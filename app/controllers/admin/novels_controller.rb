class Admin::NovelsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
before_action :require_is_admin
layout "admin"
  def show
    @novel = Novel.find(params[:id])
  end

  def index
    @novels = Novel.all
  end

  def new
    @novel = Novel.new
  end

  def create
    @novel = Novel.new(novel_params)

    if @novel.save
      redirect_to admin_novels_path
    else
      render :new
    end
  end

  def edit
    @novel = Novel.find(params[:id])
  end

  def update
    @novel = Novel.find(params[:id])
    if @novel.update(novel_params)
      redirect_to admin_novels_path
    else
      render :edit
    end
  end

  def destroy
    @novel = Novel.find(params[:id])

    @novel.destroy

    redirect_to admin_novels_path
  end
  


  private

  def novel_params
    params.require(:novel).permit(:title, :description, :author, :lead, :comment)
  end
end

