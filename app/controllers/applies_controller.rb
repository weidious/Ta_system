require 'time'
class AppliesController < ApplicationController
  
  def checkStudent
    if !Student.exists?(uin: session[:student_uin])
      flash[:error] =  "You haven't input your personal information yet."
      redirect_to controller: 'students', action: 'basic_info'
    end
  end
  
  def index
    case session[:user_type]
    when "Student"
      checkStudent
      @student = Student.find_by_uin(session[:student_uin])
      if @student
        @applies = @student.applies.order(:created_at)
      else
        @applies = []
      end
    when "Instructor"
      @instructor = Instructor.find_by_uin(session[:instructor_uin])
      if @instructor
        @applies = @instructor.applies
      else
        @applies = []
      end
    when "Admin"
      @applies = Apply.all
    end
    
    if session[:user_type]=="Students"
      checkStudent
    end
  end

  def show
    @apply = Apply.find(params[:id])
  end

  def new
    checkStudent
    @apply = Apply.new
  end

  def edit
    @apply = Apply.find(params[:id])
  end

  def create
    checkStudent
    @student = Student.find_by_uin(session[:student_uin])
    @apply = @student.applies.new(apply_params)
    if @apply.save
      flash[:notice] = "Apply was successfully saved."
      redirect_to applies_path
    else
      flash[:error] =  @apply.errors.messages
      render 'new'
    end
  end

  def update
    @apply = Apply.find(params[:id])
    if @apply.update(apply_params)
      flash[:notice] = "Course was successfully updated."
      redirect_to applies_path
    else
      flash[:error] =  @apply.errors.messages
      render 'edit'
    end
  end

  def destroy
    @apply = Apply.find(params[:id])
    @apply.destroy
    redirect_to applies_path
  end

  private
  def apply_params
    params.require(:apply).permit(:course_id, :appType, :priority, :positive, :acceptAdjust, :takenBefore, :grade)
  end
end
