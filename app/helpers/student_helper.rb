module StudentHelper
    def students_for_select
        Student.all.collect { |student| [student.fullname, student.id] }
    end
    
    def currentStudent
        if (session[:user_type] == "Student")
            Student.find_by_uin(session[:student_uin])
        else
            nil
        end
    end
end
