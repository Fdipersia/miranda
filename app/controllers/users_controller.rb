class UsersController < ApplicationController
  before_action :set_bookmarks, only: %I[show edit_profile]

  def show
    @user = current_user
    authorize @user
  end

  def index
    @users = policy_scope(User)
  end

  def edit_profile
    @user = current_user
    authorize @user
    render :show
  end

  def update_profile
    @user = User.find(current_user.id)

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "users/edit_profile"
    end
    authorize @user
  end

  private
  
  def set_bookmarks
    @bookmarks = Bookmark.where(user_id: current_user.id, checked: true).all
  end
  
  def user_params
    params.required(:user).permit(:first_name, :last_name, :photo, :email)
  end
end
