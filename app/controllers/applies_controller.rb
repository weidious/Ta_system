require 'time'
class AppliesController < ApplicationController
  def index
    @student = Student.find(params[:student_id])
    @applies = @student.applies
    #@sort = params[:sort]
    #@applies = @applies.order(@sort)
  end

  def show
    @apply = Apply.find(params[:id])
  end

  def new
    @student = Student.find(params[:student_id])
    @apply = @student.applies.new
    @courses = Course.all
    
  end

  def edit
    @student = Student.find(params[:student_id])
    @apply = Apply.find(params[:id])
  end

  def create
    @student = Student.find(params[:student_id])
    @apply = @student.applies.new(apply_params)
    if @apply.save
      flash[:notice] = "Apply was successfully saved."
      redirect_to student_applies_path
    else
      flash[:error] =  @apply.errors.messages
      render 'new'
    end
  end

  def update
    @student = Student.find(params[:student_id])
    @apply = Apply.find(params[:id])
    if @apply.update(apply_params)
      flash[:notice] = "Course was successfully updated."
      redirect_to student_applies_path
    else
      flash[:error] =  @apply.errors.messages
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:student_id])
    @apply = Apply.find(params[:id])
    @apply.destroy
    redirect_to student_applies_path
  end

  private
  def apply_params
    params.require(:apply).permit(:course_id, :appType, :priority, :positive, :acceptAdjust, :takenBefore, :grade)
  end
end
