require 'rails_helper'

RSpec.describe AppliesController, type: :controller do

  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  
  describe " test active record " do 
      
	before :each do
	    
    @inst = Instructor.new(first_name:"fname", middle_name:"mdname", last_name:"lsname",
        uin:987654321, email:"inst1245@tamu.edu")
    @inst.save!
    
	@student = Student.new(uin: 123456789, first_name: "First", middle_name: "Middle", last_name: "Last", 
	    level: 2, email: "abc@mail.com", phone: "1234567890", assigned: true, advisor_email: "cba@liam.moc", can_ta: false, can_grader: false, can_sgrader: false, perferences: "")
	@student.save!
	
	@course = Course.new(subject:"CSCE", num:606, section:600, 
        title:"Software Engineering", instructor_id: @inst.id)
    @course.save!
    

    @apply = Apply.new(course_id:@course.id, student_id:@student.id, appType:1,
        priority:1, positive:true, acceptAdjust:true, takenBefore:true, grade:"A")
    
    @apply.save!
  end
  
    it 'save one apply  with referances to course and student ' do
        # puts("28")
        @app1_id = @apply.id
        puts(@app1_id)
    end
    
it ' update apply and set to new course' do
        
    @course2 = Course.new(subject:"CSCE", num:606, section:601, 
        title:"Software Engineering", instructor_id: @inst.id)
    @course2.save!
    puts(" new course id", @course2.id)
    
    @apply2 = Apply.find_by(id: @apply.id)
#    @apply2.course_id = course2.id

    puts("before ", @apply.id)
    puts(@apply.course.id)
    
    @apply.update(course_id: @course2.id)
    
    puts("\r\nafter ", @apply.id)
    puts(@apply.course.id)
    end
  end

end
