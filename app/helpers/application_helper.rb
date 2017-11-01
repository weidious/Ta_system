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

end
