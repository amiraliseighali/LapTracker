require 'pry'

class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

 # before_action :set_current_user_for_view

  def index
    @users = User.order(created_at: :desc)
  end

  def show
    #binding.pry
    @user = User.find_by!(username: params[:id])
  end

  def feed 
    @new_post = Post.new
    @pagy, @posts = pagy(Post.where(user_id: current_user.all_following.pluck(:id)).or(Post.where(user_id: current_user.id)).order(created_at: :DESC), items: 10)
    respond_to do |format|
      format.html
      format.json{
        render json:{entries: render_to_string(partial: "feed_posts", formats: [:html]), pagination: view_context.pagy_nav(@pagy)}
      }
    end
  end


  def follow
    @user = User.find(params[:id])
    if (current_user != @user)
      current_user.follow(@user)
    end
    redirect_to(user_path(@user.username))
  end

  def unfollow
    @user = User.find(params[:id])
    if @user.followed_by?(current_user)
      current_user.stop_following(@user)
    end
    redirect_to(user_path(@user.username))
  end

  def edit
  end
  helper_method :find_user
  def find_user(id)
    #this way each user needed is manually looked up. bad or ?
    @user = User.find(id) 
  end

  def update
  end

  def delete
  end

  def destroy
  end

  # private

end
