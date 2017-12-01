require 'rails_helper'

RSpec.describe Apply, type: :model do

	before :each do 
	    @course = Course.create(subject:"CSCE", num:606, section:600, title:"Software Engineering")
	   	@student = Student.create(uin: 123456789, first_name: "First", middle_name: "Middle", last_name: "Last", level: "MCS", email: "abc@mail.com", netID:"abc", phone: "1234567890", assigned: true, advisor_email: "cba@liam.moc", can_ta: false, can_grader: false, can_sgrader: false, perferences: "")

		@apply = Apply.new(course:@course, student:@student, appType:"ta", positive:true, priority:1, acceptAdjust:true, takenBefore:true, grade:'a')
	end
	
	it "should be valid" do
	    expect(@apply).to be_valid
	end
	
	it "is invalid without course" do	
	    @apply = Apply.new(student:@student, appType:"ta", positive:true, priority:1, acceptAdjust:true, takenBefore:true, grade:'a')
		expect(@apply).not_to be_valid
	end
	
	it "is invalid without student" do
	    @apply = Apply.new(course:@course, appType:"ta", positive:true, priority:1, acceptAdjust:true, takenBefore:true, grade:'a')
		expect(@apply).not_to be_valid
	end
	
	it "is invalid without application type" do
	    @apply = Apply.new(course:@course, student:@student, positive:true, priority:1, acceptAdjust:true, takenBefore:true, grade:'a')
	   	expect(@apply).not_to be_valid
	end
	
    it "is invalid without positive" do
	    @apply = Apply.new(course:@course, student:@student, appType:"ta", priority:1, acceptAdjust:true, takenBefore:true, grade:'a')
        expect(@apply).not_to be_valid
	end

    it "is invalid without acceptAdjust" do
	    @apply = Apply.new(course:@course, student:@student, appType:"ta", positive:true, priority:1, takenBefore:true, grade:'a')
        expect(@apply).not_to be_valid
	end
	
	it "is invalid without takenBefore" do
	    @apply = Apply.new(course:@course, student:@student, appType:"ta", positive:true, priority:1, acceptAdjust:true, grade:'a')
    	expect(@apply).not_to be_valid
	end
	
end
