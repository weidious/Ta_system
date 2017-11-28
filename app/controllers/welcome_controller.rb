class WelcomeController < ApplicationController
  def index
    render layout: false
  end

  def login
    #verify the user first in the next step
    #session[:student_uin] = params[:uin]


    @netID = params[:netID]
    @password = params[:password]
    @result = `python cas.py #{@netID} #{@password}`
    puts @result
    if @result == "successful\n"
      session[:user_type] = params[:usertype]
      session[:netID] = params[:netID]
      case session[:user_type]
      when "Student"
        #session[:student_uin] = params[:uin]
        #if Student.find_by_uin(params[:uin])
        if Student.find_by_netID(params[:netID])
          #redirect_to student_dashboard_path(Student.find_by_uin(params[:uin]))
          redirect_to student_dashboard_path(Student.find_by_netID(params[:netID]))
        else
          redirect_to welcome_newStudent_path
        end
      when "Instructor"
        #if Instructor.find_by_uin(params[:uin])
        if Instructor.find_by_netID(params[:netID])
          #session[:instructor_uin] = params[:uin]
          #redirect_to instructor_dashboard_path(Instructor.find_by_uin(params[:uin]))
          redirect_to instructor_dashboard_path(Instructor.find_by_netID(params[:netID]))
        else
          flash[:error] = "Login failed. UIN is not registered as an instructor."
          redirect_to welcome_index_path
        end
      else
        redirect_to welcome_index_path
      end
    else
      flash[:notice] =  @result
      flash[:notice] =  "hi"
      flash[:error] = "Login failed. Net ID or password error."
      redirect_to welcome_index_path
    end
  end
  
  def logout
    reset_session
    session.clear
    redirect_to welcome_index_path
  end
    
  def newStudent
    render layout: false
    @student = Student.new
  end
  
  def createStudent
    @student = Student.new(params.require(:student).permit(
        :uin,
        :level,
        :date_enrolled,
        :first_name, 
        :middle_name, 
        :last_name,
        :email, 
        :advisor_email,
        :phone,
        :perferences))
    #@student.uin = session[:student_uin]
    @student.netID = session[:netID]
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
