class AdminController < ApplicationController
    
    http_basic_authenticate_with name: "admin", password: "admin"
    
    def index
        session[:user_type] = "Admin"
    end
    
    def instructors
        #@instructors = Instructor.all
        redirect_to instructors_path
    end
    
    def courses
        #@courses = Course.all
        redirect_to courses_path
    end
    
    def applies
        @applies = Apply.all
    end
    
    def offers
        @offers = Offer.all
    end
end
