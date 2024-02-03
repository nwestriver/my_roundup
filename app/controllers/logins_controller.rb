class LoginsController < ApplicationController
    def new

    end

    def create
        user = User.where(name: params[:name], email: params[:email]).first
        #binding.irb
        if user.present?
            session[:user_id] = user.id
            flash[:notice] = "ようこそ、#{user.name}さん！"
            redirect_to user_websites_path(user) 
        else 
            flash.now[:alert] = "ユーザー名またはメールアドレスが間違っています。"
            render :new
        end
    end
end
