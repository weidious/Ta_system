require 'date'
class StudentsController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "admin", only: :index

  def index
    @students = Student.all
  end

  # def new
  #   @student = Student.new
  # end

  def checkStatus
    @students = Student.all
  end

  # def basic_info
  #   @student = Student.find(params[:student_id])
  #   if(@student)
  #     redirect_to edit_student_path(@student)
  #   else
  #     #redirect_to new_student_path
  #     redirect_to welcome_logout_path
  #   end
  # end
  
  def edit
    @student = Student.find(params[:id])
  end

  # def create
  #   @student = Student.new(student_params)
  #   #@student.uin = session[:student_uin]
  #   @student.netID = session[:netID]
  #   @student.can_ta = true
  #   if @student.save
  #       flash[:notice] = "Basic information created successfully."
  #       redirect_to student_basic_info_path(@student)
  #   else
  #       flash[:error] = @student.errors.messages
  #       render 'new'
  #   end
  # end
  
  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:notice] = "Basic information was successfully updated."
      redirect_to edit_student_path(@student)
    else
      flash[:error] =  @student.errors.messages
      render 'edit'
    end
  end
  
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end
  
  def show
    @student=Student.find(params[:id])
  end
  
  def dashboard
    @student = Student.find(params[:student_id])
  end
  
  def applyall
    @student = Student.find(params[:student_id])
    @prev_app = Apply.where(student_id:params[:student_id])
    @courses = Course.all
    @appty = {}
    @prev_app.each do |app|
        @appty[app.course.id] = app.appType
    end
  end

  def updateApplyall
    @student = Student.find(params[:student_id])
    courseid2tp = params[:course]
    courseid2grade = params[:course_grade]
    @prev_app = Apply.where(student_id:params[:student_id])
    puts(@prev_app.length)
    ids = []
        # Apply.where(student_id:params[:student_id]).destroy_all
    courseid2tp.each {|cid,typ|
      # puts("course_id:" + k.to_s + "  type:" + v.to_s + "  grade:" + courseid2grade[k])
      if (typ == "none")
        Apply.where(student_id:params[:student_id], course_id:cid).destroy_all
      else
        taken = false
        grade = "Not Taken"
        if (courseid2grade[cid] != "Not Taken")
          taken = true
          grade = courseid2grade[cid]
        end
        fd = @prev_app.where(course_id:cid, student:@student.id)
        if (fd.first)
          puts("old")
          napp = fd.first
          ids << napp.update(appType:typ, priority:1,
                  acceptAdjust:true, takenBefore:taken, grade:grade, positive:true)
        else
          napp = @student.applies.new(course_id:cid, student:@student, appType:typ, priority:1,
                  acceptAdjust:true, takenBefore:taken, grade:grade, positive:true)
          ids << napp.save
        end
        
      end
    }
    
    if puts(ids.include? false)
        flash[:error] = "Updated prefered TA failed."
        redirect_to student_applyall_path(@student.id)
    else
        flash[:notice] = "Prefered TA updated successfully"
        redirect_to student_applyall_path(@student.id)
    end
  end
  
  
private
    def student_params
      params.require(:student).permit(
        :level,
        :date_enrolled,
        :first_name, 
        :middle_name, 
        :last_name,
        :email, 
        :advisor_email,
        :phone,
        :perferences)
        
    end
end
