module OffersHelper
    
    # def app_types_for_select
    #     (1..3).map {|i| [Apply.appTypeEnum(i), i]}
    #     # => [["TA", 1], ["Senor Grader", 2], ["Grader", 3]
    # end
    
    def offeredStudentName(offer)
        if offer.student
            offer.student.fullname
        else
            ""
        end
    end
    
    def offeredStudentUIN(offer)
        if offer.student
            offer.student.uin
        else
            ""
        end
    end
    
    def offeredStudentNetID(offer)
        if offer.student
            offer.student.netID
        else
            ""
        end
    end
  
end
