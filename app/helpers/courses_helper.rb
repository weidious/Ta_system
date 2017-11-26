module CoursesHelper
    def courses_for_select
        Course.all.collect {|cs| [ cs.caption, cs.id ] }
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
end
