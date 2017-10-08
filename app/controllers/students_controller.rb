class StudentsController < ApplicationController

  def index
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
    #render plain: params[:student].inspect
    @student = Student.new(student_params)
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
      params.require(:student).permit(:name, :semester)
    end
end
