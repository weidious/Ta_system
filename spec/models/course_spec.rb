require 'rails_helper'

RSpec.describe Course, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  
  before :each do
      @course = Course.new(subject:"CSCE", num:606, section:600, title:"Software Engineering", id_primary_inst:123456789)
  end
  
  it "should be valid" do
	  expect(@course).to be_valid
  end
  
  it "should have non-blank coutse title" do
      @course.title = ""
      expect(@course).not_to be_valid
  end
  
  it "should have valid course number" do
      @course.num = 95
      expect(@course).not_to be_valid
  end
end
