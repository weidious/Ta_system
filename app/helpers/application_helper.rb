module ApplicationHelper
    
    def usernav
        case session[:user_type]
        when "Admin"
            "layouts/adminmenu"
        when "Instructor"
            "layouts/insmenu"
        when "Student"
            "layouts/stumenu"
        end
    end


    def index_apply_path
        @student = Student.find_by_uin(session[:student_uin])
        if @student
            student_applies_path(@student)
        else
            flash[:error] = "Please fill in your basic information!"
            students_basic_info_path
        end
    end

end
