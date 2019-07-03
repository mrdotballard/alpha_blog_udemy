class SessionsController < ApplicationController

    #render form
    def new

    end

    #handle form submission and start session displaying user in logged-in state
    def create
      user = User.find_by(email: params[:session][:email].downcase)
      
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "You have successfully logged in"
        redirect_to user_path(user)
      else
        flash.now[:danger] = "There was something wrong with you login information"
        render 'new'
      end
    end

    #stop session and move user to logged-out state
    def destroy
      session[:user_id] = nil
      flash[:success] = "You have logged out"
      redirect_to root_path
    end

end