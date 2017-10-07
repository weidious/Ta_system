class InstructorsController < ApplicationController
  
  def show
      puts(">>>>>>>>>>>>show>>>>>>>>>>>>\r\n")
  end
  
  def delete
  end

  
  def create
    # render plain: params[:instructor].inspect
    @new_inst = Instructor.new(instructor_params)
    @new_inst.save
    redirect_to "/instructors"
  end
  
  def index
    if params[:format] then
    puts(params.to_s)
        @to_remove_uin = params[:format]
        Instructor.where(uin: @to_remove_uin).destroy_all
    end
      @inst_ls = Instructor.all
  end
  
private
  def instructor_params
    params.require(:instructor).permit(:first_name, :middle_name, :last_name, :email, :uin)
  end
  
end
