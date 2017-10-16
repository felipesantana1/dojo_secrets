class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(name:params[:name], email:params[:email], password:params[:password], password_confirmation:params[:password_confirmation])
    if @user.valid?
      @user.save
      session[:id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def show
    @secret = User.find(session[:id]).secrets
  end

  def edit
  end
end
