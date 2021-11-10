class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      flash[:alert] = "不正なアクセスです。"
      redirect_to users_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user information successfully"
      redirect_to user_path(@user)
    else
      flash[:alert] = "You have failed"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
