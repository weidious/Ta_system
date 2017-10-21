class AppliesController < ApplicationController
  def index
    if (params.has_key?(:UIN))
      session[:student_uin] = params[:UIN]
    end
    @apply = Apply.all
  end

  def new_apply
      redirect_to new_apply_path
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
    @apply.student =
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
      #redirect_to @course
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
    params.require(:apply).permit(:courseId, :appType, :priority, :positive, :acceptAdjust, :takenBefore, :grade, :created_at, :updated_at)
  end
end
