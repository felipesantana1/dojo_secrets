class LikesController < ApplicationController
    
    def create
        Like.create(user:User.find(session[:id]), secret:Secret.find(params[:secret_id]))
        redirect_to '/secrets/home'
    end
end
