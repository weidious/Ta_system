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

  def create
    #render plain: params[:student].inspect
    @student = Student.new(student_params)
    @student.save
    redirect_to @student
  end
  def show
    @student=Student.find(params[:id])
  end
private
    def student_params
      params.require(:student).permit(:name, :semester)
    end
end
