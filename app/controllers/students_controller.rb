require 'date'
class StudentsController < ApplicationController

  def index
    # you can get UIN from params
    if (params.has_key?(:UIN))
      session[:student_uin] = params[:UIN]
    end
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def checkStatus
    @students = Student.all
  end

  def basic_info
    @student = Student.find_by_uin(session[:student_uin])
    if(@student)
      redirect_to edit_student_path(@student)
    else
      redirect_to new_student_path
    end
  end
  
  def edit
    @student = Student.find(params[:id])
  end

  def create
    if session[:student_uin]
      # fetch info -> vie
    end
    #render plain: params[:student].inspect
    @student = Student.new(student_params)
    @student.uin = session[:student_uin]
    @student.can_ta = true
    if @student.save
        flash[:notice] = "Basic information created successfully."
        redirect_to students_basic_info_path
    else
        flash[:error] = @student.errors.messages
        render 'new'
    end
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:notice] = "Basic information was successfully updated."
      redirect_to students_basic_info_path
    else
      flash[:error] =  @student.errors.messages
      render 'edit'
    end
  end
  
  def show
    @student=Student.find(params[:id])
  end
  
private
    def student_params
      params.require(:student).permit(
        :level,
        :date_enrolled,
        :uin,
        :first_name, 
        :middle_name, 
        :last_name,
        :email, 
        :advisor_email,
        :phone,
        :perferences)
        
    end
end
