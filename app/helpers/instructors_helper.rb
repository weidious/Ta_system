module InstructorsHelper
    def instructors_for_select
        Instructor.all.collect {|instructor| [ instructor.fullname, instructor.id ] }
    end
    
    def currentInstructor
            Instructor.find_by_netID(session[:netID])
    end

    def offerPending(offer)
        offer.status == "sent" and (!offer.instructor_accepted or !offer.student_accepted)
    end

    def offerProcessed(offer)
        offer.instructor_accepted or offer.student_accepted
    end
end
