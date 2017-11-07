class WelcomeController < ApplicationController
  def index
    render layout: false
  end

  def login
    #verify the user first in the next step
    #session[:student_uin] = params[:uin]
    
    session[:user_type] = params[:usertype]
    
    case session[:user_type]
    when "Student"
      session[:student_uin] = params[:uin]
      if Student.find_by_uin(params[:uin])
        redirect_to student_dashboard_path(Student.find_by_uin(params[:uin]))
      else
        redirect_to welcome_newStudent_path
      end
    # when "Admin"
    #   session[:admin_uin] = params[:uin]
    #   redirect_to admin_index_path
    when "Instructor"
      if Instructor.find_by_uin(params[:uin])
        session[:instructor_uin] = params[:uin]
        redirect_to instructor_dashboard_path(Instructor.find_by_uin(params[:uin]))
      else
        flash[:error] = "Login failed. UIN is not registered as an instructor."
        redirect_to welcome_index_path
      end
    else
      redirect_to welcome_index_path
    end
  end
    
  def newStudent
    render layout: false
    @student = Student.new
  end
  
  def createStudent
    @student = Student.new(params.require(:student).permit(
        :level,
        :date_enrolled,
        :first_name, 
        :middle_name, 
        :last_name,
        :email, 
        :advisor_email,
        :phone,
        :perferences))
    @student.uin = session[:student_uin]
    @student.can_ta = true
    if @student.save
        flash[:notice] = "Student created successfully."
        redirect_to student_dashboard_path(@student)
    else
        flash[:error] = @student.errors.messages
        redirect_to welcome_newStudent_path
    end
  end
  
  
end
