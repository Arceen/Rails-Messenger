class MessagesController < ApplicationController
    before_action :require_user
    def create
        p params[:mossage]
        message = Message.new(body: params[:mossage][:body], user_id: session[:user_id])
        if message.save
            ActionCable.server.broadcast('chatroom_channel', {mod_message: message_render(message)})
        else
            message.errors.full_messages.each {|x| flash[:error] = x }
            redirect_to root_path
        end
    end
    def message_render(message)
        render(partial: 'message', locals: {message: message})
    end
end