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

  def edit
    @content = Content.find(params[:id])
  end

  def show
    @content = Content.find(params[:id])
  end

  private

  def new_content_params
    params.require(:content).permit(:title, :body)
  end
end
