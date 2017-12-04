class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @potential_user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @potential_user
      login_user(@potential_user)
      redirect_to user_url(@potential_user.id)
    else
      flash.now[:errors] = "Invalid credentials"
      render :new
    end
  end

  def destroy
    logout
    render :new
  end
end
