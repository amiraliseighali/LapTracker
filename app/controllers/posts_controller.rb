class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @posts = Post.order(event_time_date: :DESC)
  end
  #asc and desc seem to do the same



  def new
    @post = current_user.posts.build
  end

  def create 
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to(posts_path)
    else
      render('new')
    end
  end


  def edit
    @post = Post.find(params[:id])
  end 

  def update 
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to(posts_path)
    else
      render('new')
    end
  end


  def delete
    @post = Post.find(params[:id])
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(posts_path)
  end

  private
  def post_params
    params.require(:post).permit(:name, :track, :car, :tyre, :lap_time, :event_time_date, :weather)
  end


end
