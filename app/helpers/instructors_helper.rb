module InstructorsHelper
    def instructors_for_select
        Instructor.all.collect {|instructor| [ instructor.fullname, instructor.id ] }
    end
    
    def currentInstructor
        if (session[:user_type] == "Instructor")
            Instructor.find_by_uin(session[:instructor_uin])
        else
            nil
        end
    end
end
