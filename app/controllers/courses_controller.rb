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
        
      # @ta_candidates = find_candidate_ta(@course)
      # @grader_candidates = find_candidate_grader(@course)
      # @sgrader_candidates = find_candidate_sgrader(@course)
      # puts("==========>>>")
      # puts(@ta_candidates.length)
      # puts(@grader_candidates.length)
      # puts(@sgrader_candidates.length)
      
      # @grader_candidate = []
      # @sgrader_candidates = []
        
        @candidates = (Apply.where(course_id: @course.id).collect {|apply| apply.student }).uniq
        @students = Student.all
        
        
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
  
  # def find_candidate_ta(course) 
  #   ta_candidates = []
  #   # ta_applies = {}
  #   if (course.ta_candidate_1) then
  #     ta1 = Student.find_by_id(@course.ta_candidate_1)
  #     if (ta1) then
  #       ta_candidates.push(ta1)
  #       # apply = Apply.find(student:ta1, course:course, appType:1)
  #       # ta_applies[ta1.id] = apply
  #     end
  #   end
  #   if (course.ta_candidate_2) then
  #     ta1 = Student.find_by_id(@course.ta_candidate_2)
  #     if (ta1) then
  #       ta_candidates.push(ta1)
  #     end
  #   end
  #   if (course.ta_candidate_3) then
  #     ta1 = Student.find_by_id(@course.ta_candidate_3)
  #     if (ta1) then
  #       ta_candidates.push(ta1)
  #     end
  #   end
  #   if (course.ta_candidate_4) then
  #     ta1 = Student.find_by_id(@course.ta_candidate_4)
  #     if (ta1) then
  #       ta_candidates.push(ta1)
  #     end
  #   end
  #   if (course.ta_candidate_5) then
  #     ta1 = Student.find_by_id(@course.ta_candidate_5)
  #     if (ta1) then
  #       ta_candidates.push(ta1)
  #     end
  #   end
  #   ta_candidates
  # end
  
  # def find_candidate_grader(course)
  #   grader_candidates = []
  #   if (course.grader_candidate_1) then
  #     ta1 = Student.find_by_id(@course.grader_candidate_1)
  #     if (ta1) then
  #       grader_candidates.push(ta1)
  #     end
  #   end
  #   if (course.grader_candidate_2) then
  #     ta1 = Student.find_by_id(@course.grader_candidate_2)
  #     if (ta1) then
  #       grader_candidates.push(ta1)
  #     end
  #   end
  #   if (course.grader_candidate_3) then
  #     ta1 = Student.find_by_id(@course.grader_candidate_3)
  #     if (ta1) then
  #       grader_candidates.push(ta1)
  #     end
  #   end
  #   if (course.grader_candidate_4) then
  #     ta1 = Student.find_by_id(@course.grader_candidate_4)
  #     if (ta1) then
  #       grader_candidates.push(ta1)
  #     end
  #   end
  #   if (course.grader_candidate_5) then
  #     ta1 = Student.find_by_id(@course.grader_candidate_5)
  #     if (ta1) then
  #       grader_candidates.push(ta1)
  #     end
  #   end
  #   grader_candidates
  # end
  
  
  # def find_candidate_sgrader(course)
  #   grader_candidates = []
  #   if (course.sgrader_candidate_1) then
  #     ta1 = Student.find_by_id(@course.sgrader_candidate_1)
  #     if (ta1) then
  #       grader_candidates.push(ta1)
  #     end
  #   end
  #   if (course.sgrader_candidate_2) then
  #     ta1 = Student.find_by_id(@course.sgrader_candidate_2)
  #     if (ta1) then
  #       grader_candidates.push(ta1)
  #     end
  #   end
  #   if (course.sgrader_candidate_3) then
  #     ta1 = Student.find_by_id(@course.sgrader_candidate_3)
  #     if (ta1) then
  #       grader_candidates.push(ta1)
  #     end
  #   end
  #   if (course.sgrader_candidate_4) then
  #     ta1 = Student.find_by_id(@course.sgrader_candidate_4)
  #     if (ta1) then
  #       grader_candidates.push(ta1)
  #     end
  #   end
  #   if (course.sgrader_candidate_5) then
  #     ta1 = Student.find_by_id(@course.sgrader_candidate_5)
  #     if (ta1) then
  #       grader_candidates.push(ta1)
  #     end
  #   end
  #   grader_candidates
  # end
  
end
