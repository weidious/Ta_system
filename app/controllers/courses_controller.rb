class CoursesController < ApplicationController

    def index
        @courses = Course.all.order(:num)
    end
    
    
    def show
        @course = Course.find(params[:id])
    end
    
    def new
        @course = Course.new
    end
    
    def edit
        @course = Course.find(params[:id])
        @instructors = Instructor.all
      
        @ta_applicants = Apply.where(course:@course, appType:1).pluck(:student_id);
        @grader_applicants = Apply.where(course:@course, appType:2).pluck(:student_id);
        @sgrader_applicants = Apply.where(course:@course, appType:3).pluck(:student_id);
        
        @ta_candidates = Student.where(id: @course.ta_candidate_ids)#.sort_by { |u| @course.ta_candidate_ids.index u.id }
        @sgrader_candidates = Student.where(id: @course.sgrader_candidate_ids)#.sort_by { |u| @course.sgrader_candidate_ids.index u.id }
        @grader_candidates = Student.where(id: @course.grader_candidate_ids)#.sort_by { |u| @course.grader_candidate_ids.index u.id }
          
        #@candidates = (Apply.where(course_id: @course.id).collect {|apply| apply.student }).uniq
        @candidates = @course.students.uniq
        @students = Student.all
    end
    
    def candidate_type(student)
        if @ta_candidates.include?student
            "ta"
        elsif @sgrader_candidates.include?student
            "senior_grader"
        elsif @grader_candidates.include?student
            "grader"
        else
            "none"
        end
    end
    
    def candidates
      @course = Course.find(params[:course_id])
      @students = Student.all
      @ta_candidates = Student.where(id: @course.ta_candidate_ids)
      @sgrader_candidates = Student.where(id: @course.sgrader_candidate_ids)
      @grader_candidates = Student.where(id: @course.grader_candidate_ids)
      @job = {}
      @students.each do |student|
        @job[student.id] = candidate_type(student)
      end
    end
    
    def updateCandidates
      #flash[:notice] = params[:job]
      @course = Course.find(params[:course_id])
      @ta_candidate_ids = params[:job].select{|key, value| value == "ta" }.keys
      @sgrader_candidate_ids = params[:job].select{|key, value| value == "senior_grader" }.keys
      @grader_candidate_ids = params[:job].select{|key, value| value == "grader" }.keys
      @course.update_ta_candidates(@ta_candidate_ids)
      @course.update_sgrader_candidates(@sgrader_candidate_ids)
      @course.update_grader_candidates(@grader_candidate_ids)
      if @course.save
        flash[:notice] = "Prefered TA updated successfully"
        #redirect_to courses_path
        redirect_to course_candidates_path(@course)
      else
        flash[:error] = "Updated prefered TA failed."
        redirect_to course_candidates_path(@course)
      end
    end
    
    
    def create
        @course = Course.new(course_params)
        flash.keep
        if @course.save
          flash[:notice] = "Course was successfully saved."
          redirect_to courses_path
        else
          flash[:error] =  'Failed to save. ' #@course.errors.messages
          render 'new'
        end
    end

    def update
      @course = Course.find(params[:id])
     
      if @course.update(course_params)
          flash[:notice] = "Course was successfully updated."
          redirect_to courses_path
      else
          flash[:error] =  @course.errors.messages
          render 'edit'
      end
    end

    def destroy
      @course = Course.find(params[:id])
      if @course.destroy
        flash[:notice] = "Course was successfully deleted."
      end
      redirect_to courses_path
    end
    
    private
    
      def course_params
        params.require(:course).permit(:subject, :num, :section, :title, :instructor_id, :num_ta, :num_grader, :num_sgrader, :requirement_ta, :requirement_grader, :requirement_sgrader, :ta_candidate_1, :ta_candidate_2, :ta_candidate_3, :ta_candidate_4, :ta_candidate_5, :grader_candidate_1, :grader_candidate_2, :grader_candidate_3, :grader_candidate_4, :grader_candidate_5, :sgrader_candidate_1, :sgrader_candidate_2, :sgrader_candidate_3, :sgrader_candidate_4, :sgrader_candidate_5)
      end
  
end
