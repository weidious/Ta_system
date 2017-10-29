class CoursesController < ApplicationController

    def index
        #flash.keep
        @courses = Course.all.order(:num)
    end
    
    
    def show
        @course = Course.find(params[:id])
    end
    
    def new
        @course = Course.new
        @instructors = Instructor.all
    end
    
    
    def edit
        @course = Course.find(params[:id])
        @instructors = Instructor.all
    end
    
    
    def create
        @course = Course.new(course_params)
        flash.keep
        if @course.save
          flash[:notice] = "Course was successfully saved."
          redirect_to courses_path
          #redirect_to courses_path, notice: 'Course was successfully saved.'
        else
          flash[:error] =  'Failed to save. ' #@course.errors.messages
          render 'new'#, error: 'Course was not successfully saved.'
        end
        flash.keep
        #redirect_to courses_path
    end

    def update
      @course = Course.find(params[:id])
     
      if @course.update(course_params)
          flash[:notice] = "Course was successfully updated."
          #redirect_to @course
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
