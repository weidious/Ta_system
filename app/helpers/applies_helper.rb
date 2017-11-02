module AppliesHelper
    def appTypes_for_select
        (1..3).map {|i| [Apply.appTypeEnum(i), i]}
        # => [["TA", 1], ["Senor Grader", 2], ["Grader", 3]
    end
    
    def booleans_for_select
        [["Yes", true], ["No", false]]
    end
    
    def booleanCaption(b)
        if b then
            'Yes'
        else
            'No'
        end
    end
    
    def editable
        if session[:user_type] == "Student"
            true
        else
            false
        end
    end
end
