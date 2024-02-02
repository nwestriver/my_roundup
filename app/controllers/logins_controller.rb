class LoginsController < ApplicationController
    def new

    end

    def create
        user = User.where(name: params[:name], email: params[:email]).first
        #binding.irb
        if user.present?
            session[:user_id] = user.id
            redirect_to websites_path 
        else 
            render :new
        end
    end
end
