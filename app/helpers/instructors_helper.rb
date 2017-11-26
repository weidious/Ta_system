module InstructorsHelper
    def instructors_for_select
        Instructor.all.collect {|instructor| [ instructor.fullname, instructor.id ] }
    end
    
    def currentInstructor
            Instructor.find_by_netID(session[:netID])
    end
end
