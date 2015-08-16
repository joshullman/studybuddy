module AuthenticationConcern

  extend ActiveSupport::Concern
  included do
    helper_method :current_teacher
    helper_method :current_student
  end

  def current_teacher
    @current_teacher ||= Teacher.find(session[:user_id]) if session[:user_id] && session[:teacher]
  end

  def current_student
    @current_student ||= Student.find(session[:user_id]) if session[:user_id] && session[:student]
  end

end


# http://api.rubyonrails.org/classes/ActiveSupport/Concern.html
# READ THIS
