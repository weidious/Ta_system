module InstructorsHelper
    def instructors_for_select
        Instructor.all.collect {|instructor| [ instructor.fullname, instructor.id ] }
    end
end
