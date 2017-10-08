class StudentsController < ApplicationController

  def index
    # you can get UIN from params
    session[:student_uin] = params[:UIN]
    @students = Student.all
  end

  def new

  end

  def checkStatus
    @students = Student.all
  end

  def apply

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
    
    @student.can_ta = true
    #...
    @student.last_modified = Time.now
        
    @student.save
    redirect_to @student
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to @student
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
