class InstructorsController < ApplicationController
  
  def index
    @instructors = Instructor.all.order(:id)
    if session[:user_type] == "Instructor"
        @instructors = Instructor.where(uin: session[:instructor_uin])
    elsif session[:user_type] == "Student"
        @instructors = []
    end
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

  
private
  def instructor_params
    params.require(:instructor).permit(:first_name, :middle_name, :last_name, :email, :uin)
  end
  
end
