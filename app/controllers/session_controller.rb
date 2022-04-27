class SessionController < ApplicationController
    
    def new
        if logged_in?
            flash[:error] = "You are already logged in"
            redirect_to root_path
            return
        end
    end
    def create
        user = User.all.select {|user| user.username == params[:session][:username] && user.authenticate(params[:session][:password])}
        if user.length == 1
            user = user[0]
            p user
            session[:user_id] = user.id
            session[:username] = user.username
            temp = User.all.select {|user_rest| user_rest.username != user.username}
            session[:all_users] = temp.map {|x| {id: x.id, username: x.username}}
            flash[:success] = "Logged In successfully"
            redirect_to root_path
        else
            flash[:error] = "Login unsuccessful"
            redirect_to login_path
        end

    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You have successfully logged out"
        redirect_to root_path
    end
end