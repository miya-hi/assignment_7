class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit]
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
  end
  def edit
  end
  private
  def blog_params
    params.require(:blog).permit(:content, :image)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
