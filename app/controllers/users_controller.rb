class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @users = User.all
  end

  def create
  end

  def edit
  end

  def update
  end

end
