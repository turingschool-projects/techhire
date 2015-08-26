class Admin::ContentsController < ApplicationController
  before_action :authorize!

  def index
    all = Content.all
    @home = all.where("name LIKE '%home%'").order('location')
    @xpanxion     = all.where("name LIKE '%xpan%'").order('location')
    @capital_one  = all.where("name LIKE '%cap_one%'").order('location')
    @learn_more      = all.where("name LIKE '%learn_more%'").order('location')
    @tools_resources = all.where("name LIKE '%tools_resource%'").order('location')
    @rural_sourcing  = all.where("name LIKE '%rural_source%'").order('location')
    @techhire_locations  = all.where("name LIKE '%tech_locations%'").order('location')
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
