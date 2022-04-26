class ChatroomController < ApplicationController
    def index
        if !logged_in?
            redirect_to login_path
        end
        @messages = Message.all
    end
end
