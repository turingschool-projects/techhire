class Admin::ContentsController < ApplicationController
  # TODO: Make sure this is covered by authorization

  def index
    @contents = Content.all.order('updated_at DESC')
  end

  def create
    content = Content.new(new_content_params)
    if content.save
      flash[:notice] = "Content successfully created."
      redirect_to admin_contents_path
    else
      flash[:error] = content.errors.messages.values[0][0]
      redirect_to admin_contents_path
    end
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
  end

  def destroy
    if Content.find(params[:id]).destroy
      flash[:notice] = "Content Deleted"
      redirect_to admin_contents_path
    else
      flash[:errors] = "Content not deleted, Please try again."
      redirect_to admin_contents_path
    end
  end

  private

  def new_content_params
    params.require(:content).permit(:title, :body)
  end
end
