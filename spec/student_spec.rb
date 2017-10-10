require 'rails_helper'

describe Student do
	before :each do
		@student = Student.new(uin: 123456789, first_name: "First", middle_name: "Middle", last_name: "Last", level: 2, email: "abc@mail.com", phone: "1234567890", assigned: true, advisor_email: "cba@liam.moc", can_ta: false, can_grader: false, can_sgrader: false, perferences: "")
	end
	
	it "should be valid" do
	    expect(@student).to be_valid
	end
	
	it "is invalid without user name" do
		st = Student.new(first_name: "", last_name: "l")
		expect(st).not_to be_valid
	end

	it "invalid without first name" do
		@student.first_name = ''
		@student.valid?
		expect(@student.errors[:first_name]).to include("can't be blank")
	end
	
	it "invalid without last name" do
		@student.last_name = ''
		@student.valid?
		expect(@student.errors[:last_name]).to include("can't be blank")
	end

	it "is invalid without email" do
		@student.email = ''
		@student.valid?
		expect(@student.errors[:email]).to include("can't be blank")
	end

	it "is invalid if email is too long" do
		@student.email = "e" * 51
		expect(@student).not_to be_valid
	end

	it "is invalid with a error format email" do
		invalid_email = %w(
			adsga@@gmail.com
			adfasgasdfas.coadf
			asdfgfadfsagasf@hotmail
		)
		invalid_email.each do |e|
			@student.email = e
			expect(@student).not_to be_valid
		end
	end

end