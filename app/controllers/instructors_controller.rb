class InstructorsController < ApplicationController
  
  def index
    @instructors = Instructor.all.order(:last_name)
  end
  
  def show
      @instructor = Instructor.find(params[:id])
  end
  
  def new
    @instructor = Instructor.new
  end
  
  def edit
    @instructor = Instructor.find(params[:id])
  end
  
  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
    redirect_to instructors_path
  end

  def create
    # render plain: params[:instructor].inspect
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      flash[:notice] = "Instructor was successfully saved."
      redirect_to instructors_path
    else
      flash[:error] =  @instructor.errors.messages
      render 'new'
    end
  end
  
  def update
    @instructor = Instructor.find(params[:id])
   
    if @instructor.update(instructor_params)
        flash[:notice] = "Instructor was successfully updated."
        redirect_to instructors_path
    else
        flash[:error] =  @instructor.errors.messages
        render 'edit'
    end
  end
  
  def dashboard
    @instructor = Instructor.find(params[:instructor_id])
  end
  
  def courses
    @instructor = Instructor.find(params[:instructor_id])
    @courses = @instructor.courses.order(:num)
  end
  
  def applies
    @instructor = Instructor.find(params[:instructor_id])
    @applies = @instructor.applies
  end

  
private
  def instructor_params
    params.require(:instructor).permit(:first_name, :middle_name, :last_name, :email, :uin, :netID)
  end
  
end
