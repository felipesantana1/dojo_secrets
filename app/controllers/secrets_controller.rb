class SecretsController < ApplicationController

  def home
    @secret = Secret.all
    @likes = Like.all
  end

  def create
    @secret = Secret.new(secret:params[:secret], user:User.find(session[:id]))
    if @secret.valid?
      @secret.save
      redirect_to "/users/#{session[:id]}"
    else
      flash[:errors] = @secret.errors.full_messages
      redirect_to "/users/#{session[:id]}"
    end
  end

  def destroy
    Secret.find(params[:secret_id]).destroy
    redirect_to "/users/#{session[:id]}"
  end
end
