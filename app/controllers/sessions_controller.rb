class SessionsController < ApplicationController
  def new

  end

  def create
    @user = Teacher.where(username: params[:session][:username]).first || Student.where(username: params[:session][:username]).first

    if @user && @user.class.to_s == "Teacher" && (@user.password == params[:session][:password])
      session[:user_id] = @user.id
      session[:teacher] = true
      redirect_to root_url
    elsif @user && @user.class.to_s == "Student" && (@user.password == params[:session][:password])
      session[:user_id] = @user.id
      session[:student] = true
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
