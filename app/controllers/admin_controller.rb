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
    
    def students
        redirect_to students_path
    end
    
    def applies
        @applies = Apply.all
    end
    
    def offers
        @offers = Offer.all.order(:course_id)
    end
    
    def ta_matching
       @offers = Offer.all
       @students = Student.all
       @offers.each do |offer|
          offer.update(student: @students.sample, status: :unsent) 
       end
       redirect_back(fallback_location: root_path)
       #redirect_to admin_offers_path
    end
end
