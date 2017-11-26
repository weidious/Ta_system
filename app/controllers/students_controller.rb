require 'date'
class StudentsController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "admin", only: :index

  def index
    @students = Student.all
  end

  # def new
  #   @student = Student.new
  # end

  def checkStatus
    @students = Student.all
  end

  # def basic_info
  #   @student = Student.find(params[:student_id])
  #   if(@student)
  #     redirect_to edit_student_path(@student)
  #   else
  #     #redirect_to new_student_path
  #     redirect_to welcome_logout_path
  #   end
  # end
  
  def edit
    @student = Student.find(params[:id])
  end

  # def create
  #   @student = Student.new(student_params)
  #   #@student.uin = session[:student_uin]
  #   @student.netID = session[:netID]
  #   @student.can_ta = true
  #   if @student.save
  #       flash[:notice] = "Basic information created successfully."
  #       redirect_to student_basic_info_path(@student)
  #   else
  #       flash[:error] = @student.errors.messages
  #       render 'new'
  #   end
  # end
  
  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:notice] = "Basic information was successfully updated."
      redirect_to student_basic_info_path(@student)
    else
      flash[:error] =  @student.errors.messages
      render 'edit'
    end
  end
  
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end
  
  def show
    @student=Student.find(params[:id])
  end
  
  def dashboard
    @student = Student.find(params[:student_id])
  end
  
private
    def student_params
      params.require(:student).permit(
        :level,
        :date_enrolled,
        :first_name, 
        :middle_name, 
        :last_name,
        :email, 
        :advisor_email,
        :phone,
        :perferences)
        
    end
end
