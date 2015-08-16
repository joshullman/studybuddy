class SessionsController < ApplicationController
  def new

  end

  def create
    @user = Teacher.where(email: params[:session][:email]).first || Student.where(email: params[:session][:email]).first
    p "*" * 50
    p @user.class.to_s

    if @user && @user.class.to_s == "Teacher" && (@user.password_digest == params[:session][:password_digest])
      session[:user_id] = @user.id
      session[:teacher] = true
      session[:student] = false

      redirect_to teachers_path
    elsif @user && @user.class.to_s == "Student" && (@user.password_digest == params[:session][:password_digest])
      session[:user_id] = @user.id
      session[:student] = true
      session[:teacher] = false

      p "i'm a student"

      redirect_to students_path
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
