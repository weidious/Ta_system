require 'rails_helper'

RSpec.describe Offer, type: :model do

  	before :each do
  	    @course = Course.create(subject:"CSCE", num:606, section:600, title:"Software Engineering")
	   	@student = Student.create(uin: 123456789, first_name: "First", middle_name: "Middle", last_name: "Last", level: "MCS", email: "abc@mail.com", netID:"abc", phone: "1234567890", assigned: true, advisor_email: "cba@liam.moc", can_ta: false, can_grader: false, can_sgrader: false, perferences: "")
		@offer = Offer.new(student:@student, course:@course, app_type:"ta", student_accepted:true, instructor_accepted:true, advisor_accepted:true)
	end
	
	it "should be valid" do
	    expect(@offer).to be_valid
	end
	
end
