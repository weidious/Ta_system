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
    end
    
    
    def create
        @course = Course.new(course_params)
        if @course.save
          flash[:notice] = "Course was successfully saved."
          redirect_to courses_path
        else
          flash[:error] =  @course.errors.messages
          render 'new'
        end
        #flash.keep
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
      @course.destroy
     
      redirect_to courses_path
    end
    
    private
      def course_params
        params.require(:course).permit(:subject, :num, :section, :title, :instructor_id, :num_ta, :num_grader, :num_sgrader, :requirement_ta, :requirement_grader, :requirement_sgrader, :ta_candidate_1, :ta_candidate_2, :ta_candidate_3, :ta_candidate_4, :ta_candidate_5, :grader_candidate_1, :grader_candidate_2, :grader_candidate_3, :grader_candidate_4, :grader_candidate_5, :sgrader_candidate_1, :sgrader_candidate_2, :sgrader_candidate_3, :sgrader_candidate_4, :sgrader_candidate_5)
      end
  
end
