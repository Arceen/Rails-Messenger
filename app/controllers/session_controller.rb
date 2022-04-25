class SessionController < ApplicationController
    
    def new
    end
    def create
        user = User.all.select {|user| user.username == params[:session][:username] && user.authenticate(params[:session][:password])}
        if user.length == 1
            user = user[0]
            p user
            session[:user_id] = user.id
            flash[:success] = "Logged In successfully"
            redirect_to root_path
        else
            flash[:error] = "Login unsuccessful"
            render 'new'
        end

    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You have successfully logged out"
        redirect_to login_path
    end
end