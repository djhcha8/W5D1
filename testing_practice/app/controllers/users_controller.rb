class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @new_user = User.new(user_params)

    if @new_user.save
      login_user(@new_user)
      redirect_to user_url(@new_user.id)
    else
      flash.now[:errors] = @new_user.errors.full_messages
      render :new
    end
  end

  def show
    @shown_user = User.find_by(id: params[:id])

    if @shown_user
      render :show
    else
      flash.now[:errors] = "You must be signed in to view your profile page"
      redirect_to new_session_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
