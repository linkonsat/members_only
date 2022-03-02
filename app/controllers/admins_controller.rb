class AdminsController < ApplicationController

    def dashboard 
        if(current_user.admin?)
        else
            redirect_to "/"
        end
    end
end
