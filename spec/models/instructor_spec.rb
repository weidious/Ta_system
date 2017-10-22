require 'rails_helper'
require "validates_email_format_of/rspec_matcher"

RSpec.describe Instructor, type: :model do
    #pending "add some examples to (or delete) #{__FILE__}"
  
	before :each do
		@instructor = Instructor.new(first_name: "Frst", last_name: "Lst", email: "test@test.com", uin: 123456789)
	end

	it "is invalid without first name" do
		@instructor.first_name = ''
		@instructor.valid?
		expect(@instructor.errors[:first_name]).to include("can't be blank")
	end
	
	it "is invalid without last name" do
		@instructor.last_name = ''
		@instructor.valid?
		expect(@instructor.errors[:last_name]).to include("can't be blank")
	end
	
	it "is invalid if first name is too long" do
		@instructor.first_name = "f" * 256
		expect(@instructor).not_to be_valid
	end
	
	it "is invalid if last name is too long" do
		@instructor.last_name = "l" * 256
		expect(@instructor).not_to be_valid
	end

	it "is invalid without email" do
		@instructor.email = ''
		@instructor.valid?
		expect(@instructor.errors[:email]).to include("can't be blank")
	end
	
	it "is invalid if email is too long" do
		@instructor.email = "e" * 256
		expect(@instructor).not_to be_valid
	end
	
	it "is invalid with a error format email" do
		invalid_email = %w(
			"test1@@hotmail.com"
			"test2@hotmail"
			"test3hotmail.com"
			"test+4@hotmail.com"
		)
		invalid_email.each do |email|
			@instructor.email = email
			expect(@instructor).not_to be_valid
		end
	end

# 	it "is invalid with a duplication email" do
# 		instructorFake = @instructor.clone
# 		instructorFake.save
# 		@instructor.valid?
# 		expect(@instructor.errors.messages[:email]).to include("has already been taken")
# 	end
	
	it "is invalid without uin" do
		@instructor.uin = ''
		@instructor.valid?
		expect(@instructor.errors[:uin]).to include("can't be blank")
	end
	
	it "is invalid with uin smaller than 100000000" do
		@instructor.uin = 123
		expect(@instructor).not_to be_valid
	end
	
	it "is invalid with uin larger 9999999999" do
		@instructor.uin = 10000000000
		expect(@instructor).not_to be_valid
	end
	
# 	it "is invalid with a duplication uin" do
# 		instructorFake = @instructor.clone
# 		instructorFake.save
# 		@instructor.valid?
# 		expect(@instructor.errors.messages[:uin]).to include("has already been taken")
# 	end

end
