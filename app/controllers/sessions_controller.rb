class SessionsController < ApplicationController
  def create
    @user = Teacher.where(username: params[:session][:username]).first || Student.where(username: params[:session][:username]).first

    if @user && (@user.password == params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_url
    else
      @signin_error = "Username/Password invalid. Please try again."
      # checkout Hartl Ch.8 for implementing flash msgs to catch session errors
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
