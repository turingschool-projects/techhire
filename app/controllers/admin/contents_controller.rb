class Admin::ContentsController < ApplicationController
  # TODO: Make sure this is covered by authorization

  def index
    all = Content.all
    @map  = all.where(page_id: 4).order('location')
    @home = all.where(page_id: 1).order('location')
    @learn_more      = all.where(page_id: 3).order('location')
    @tools_resources = all.where(page_id: 2).order('location')
  end

  def update
    content = Content.find(params[:id])
    if content.update_attributes(new_content_params)
      redirect_to admin_contents_path
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
    @page_name = Page.find(@content.page_id).name
  end

  private

  def new_content_params
    params.require(:content).permit(:title, :body)
  end
end
