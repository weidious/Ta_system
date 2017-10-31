require 'time'
class AppliesController < ApplicationController
  
  def index
    @applies = Apply.all.order(:created_at)
  end

  def show
    @apply = Apply.find(params[:id])
  end

  def new
    @apply = Apply.new
  end

  def edit
    @apply = Apply.find(params[:id])
  end

  def create
    if session[:student_uin]
      # fetch info -> vie
    end
    #render plain: params[:student].inspect
    @apply = Apply.new(apply_params)
    @apply.student_id = Student.find_by_uin!(session[:student_uin]).id
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
    # params.require(:apply).permit(:courseId, :studentId, :appType, :priority, :positive, :acceptAdjust, :takenBefore, :grade, :created_at, :updated_at)
    params.require(:apply).permit(:course_id, :appType, :priority, :positive, :acceptAdjust, :takenBefore, :grade, :created_at, :updated_at)
  end
end
