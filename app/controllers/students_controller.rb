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

  end

  def checkStatus
    @students = Student.all
  end

  def basic_info
    #@students = Student.all
    @student = Student.find_by_uin(session[:student_uin])
    if(@student)
      #@the_date = eval(@student.date_enrolled)
      #@level = @student.level
      #@student.date_enrolled = nil
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
    #...
    @student.last_modified = Time.now

    #@student.save
    if(@student.valid? and @student.save)
        flash[:notice] = "Basic information created successfully."
    else
        flash[:notice] = @student.errors.messages
    end
    flash.keep
    redirect_to students_basic_info_path
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to students_basic_info_path
    else
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
