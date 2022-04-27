class ChatroomController < ApplicationController
    def index
        if !logged_in?
            redirect_to login_path
        end

        temp = User.all.select {|user_rest| user_rest.id != session[:user_id]}
        session[:all_users] = temp.map {|x| {id: x.id, username: x.username}}
            
        @messages = Message.custom_display
    end
end
