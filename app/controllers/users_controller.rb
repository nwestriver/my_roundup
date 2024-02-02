class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
       # binding.irb
        if @user.save
            #session処理
            session[:user_id] = @user.id
            redirect_to websites_url
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end



    private
    def user_params
        params.require(:user).permit(:name, :email, :password_digest)
    end
end
