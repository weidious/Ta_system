class InstructorsController < ApplicationController
  
  def index
    #if params[:format] then
    #puts(params.to_s)
    #    @to_remove_uin = params[:format]
    #    Instructor.where(uin: @to_remove_uin).destroy_all
    #end
    #  @inst_ls = Instructor.all
    @instructors = Instructor.all
    if session[:user_type] == "Instructor"
        @instructors = Instructor.where(uin: session[:instructor_uin])
    end
  end
  
  def show
      #puts(">>>>>>>>>>>>show>>>>>>>>>>>>\r\n")
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
    #@new_inst = Instructor.new(instructor_params)
    #@new_inst.save
    #redirect_to "/instructors"
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
