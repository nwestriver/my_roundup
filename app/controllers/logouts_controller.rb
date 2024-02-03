class LogoutsController < ApplicationController
    def destroy
        session.delete(:user_id)
        flash[:notice] = "ログアウトしました。"
        redirect_to root_url status: :see_other
    end
end
