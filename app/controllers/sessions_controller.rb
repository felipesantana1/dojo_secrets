class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if @user
      session[:id] = @user.id
      puts session[:id]
      flash[:success] ="Successfully Logged In!"
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = "Invalid combination"
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session[:id] = nil
    redirect_to "/sessions/new"
  end

end
