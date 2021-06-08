class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render.new
    else
      if @blog.save
        redirect_to blogs_path, notice: "投稿しました！"
      else
        render.new
      end
    end
  end
  def index
    @blogs = Blog.all
  end
  def show
    @blog = Blog.find(params[:id])
  end
  private
  def blog_params
    params.require(:blog).permit(:content, :image)
  end
end
