class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order('created_at DESC').page params[:page]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :body, :photo, :popular_post))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  def delete_photo
    @post = Post.find(params[:post_id])
    @post.photo = nil
    @post.save

    redirect_to edit_post_path @post
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :photo, :popular_post).merge(user_id: current_user.id)
    end
end
