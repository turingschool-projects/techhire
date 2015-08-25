class Admin::ContentsController < ApplicationController
  before_action :authorize!

  def index
    all = Content.all
    @home = all.where(page_id: 1).order('location')
    @learn_more      = all.where(page_id: 3).order('location')
    @tools_resources = all.where(page_id: 2).order('location')
    @techhire_locations  = all.where(page_id: 4).order('location')
  end

  def update
    content = Content.find(params[:id])
    if content.update_attributes(new_content_params)
      flash[:success] = "Content Updated"
      redirect_to edit_admin_content_path(content.id)
    else
      flash[:errors] = "Please try again!"
      render :edit
    end
  end

  def show
    @content = Content.find(params[:id])
  end

  def edit
    @content = Content.find(params[:id])
    @page = Page.find(@content.page_id)
  end

  private

  def new_content_params
    params.require(:content).permit(:title, :body)
  end
end
