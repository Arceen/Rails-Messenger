class MessagesController < ApplicationController
    before_action :require_user
    def create
        p params[:mossage]
        @message = Message.new(body: params[:mossage][:body], user_id: session[:user_id])
        if @message.save
            @messages = Message.all
            redirect_to root_path
        else
            @message.errors.full_messages.each {|x| flash[:error] = x }
            redirect_to root_path
        end
    end
end