module StudentsHelper
    def students_for_select
        Student.all.collect {|s| [ s.fullname, s.id ] }
    end
    
    def currentStudent
            Student.find_by_netID(session[:netID])
    end
end
