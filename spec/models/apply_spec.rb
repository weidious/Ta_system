require 'rails_helper'

RSpec.describe Apply, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
  
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
    
    
  end
  
  
    it 'save one apply  with referances to course and student ' do
        @apply.save!
        puts(@apply.id)
    end
    
end
