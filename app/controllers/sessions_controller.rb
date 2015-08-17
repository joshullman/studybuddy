class SessionsController < ApplicationController
  def new

  end

  def create
    @user = Teacher.where(email: params[:session][:email]).first || Student.where(email: params[:session][:email]).first

    if @user && @user.class.to_s == "Teacher" && (@user.password_digest == params[:session][:password_digest])
      session[:user_id] = @user.id
      session[:teacher] = true
      session[:student] = false

      redirect_to teacher_path(@user)
    elsif @user && @user.class.to_s == "Student" && (@user.password_digest == params[:session][:password_digest])
      session[:user_id] = @user.id
      session[:student] = true
      session[:teacher] = false

      redirect_to student_path(@user)
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
