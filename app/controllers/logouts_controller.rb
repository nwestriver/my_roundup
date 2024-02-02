class LogoutsController < ApplicationController
    def destroy
        session.delete(:user_id)
        redirect_to root_url status: :see_other
    end
end
