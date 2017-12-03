require 'rails_helper'

RSpec.describe Course, type: :model do

  before :each do
       @course = Course.new(subject:"CSCE", num:606, section:600, title:"Software Engineering")
   end
   
   it "should be valid" do
 	  expect(@course).to be_valid
  end
   
   it "should have non-blank course title" do
       @course.title = ""
       expect(@course).not_to be_valid
   end
   
   it "should have course number" do
       @course.num = nil
       expect(@course).not_to be_valid
   end
   
   it "should have valid course number" do
       @course.num = 95
       expect(@course).not_to be_valid
   end
   
   it "should have caption" do
       expect(@course.caption).to eql("CSCE 606-600  Software Engineering")
   end
   
   it "should have ta_candidate_ids" do
       expect(@course.ta_candidate_ids).to eql([])
   end
 
   it "should have grader_candidate_ids" do
       expect(@course.grader_candidate_ids).to eql([])
   end
   
   it "should have sgrader_candidate_ids" do
       expect(@course.sgrader_candidate_ids).to eql([])
   end
     
   it "should generate_offers" do
       @course.save!
       expect(@course.generate_offers).to eql(0)
   end
   
   it "should be able to update_ta_candidates" do
       @course.update_ta_candidates([1,2,3,4,5])
       expect(@course.ta_candidate_ids).to eql([1,2,3,4,5])
   end
   
   it "should be able to update_grader_candidates" do
       @course.update_grader_candidates([5,4,3,2,1])
       expect(@course.grader_candidate_ids).to eql([5,4,3,2,1])
   end
   
   it "should be able to update_sgrader_candidates" do
       @course.update_sgrader_candidates([1,2,3,4,5])
       expect(@course.sgrader_candidate_ids).to eql([1,2,3,4,5])
   end
   
end
