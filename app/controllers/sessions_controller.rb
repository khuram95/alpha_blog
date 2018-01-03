class SessionsController < ApplicationController
    def new
    end
    def create
        #debugger
        user=User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id]=user.id
            flash.now[:success]="login successfully"
            redirect_to user_path(user)
        else
            flash.now[:danger]="there is something wrong with login information"
            render 'new'
        end
    end
    def destroy
       session[:user_id]=nil
       flash[:success] = "logout successfully"
       redirect_to root_path
    end
end