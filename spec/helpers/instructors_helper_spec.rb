require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the OfferDecisionHelper. For example:
#
# describe OfferDecisionHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe InstructorsHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "#instructors_for_select" do
    it "returns instructors" do
      expect(helper.instructors_for_select).to eq(Instructor.all.collect {|instructor| [ instructor.fullname, instructor.id ] })
    end
  end

  describe "#currentInstructor" do
    it "returns current instructor" do
      expect(helper.currentInstructor).to eq(Instructor.find_by_netID(session[:netID]))
    end
  end

  describe "#offerPending" do
    @student = Student.create(:uin => 123456789, :last_name => "l", :first_name => 'f', :netID => "n")
    offer = Offer.create(:student => @student, :status => "sent", :instructor_accepted => nil, :student_accepted => nil)
    it "returns false" do
      expect(helper.offerPending(offer)).to eq(TRUE)
    end
  end

  describe "#offerProcessed" do
    @student = Student.create(:uin => 123456789, :last_name => "l", :first_name => 'f', :netID => "n")
    offer = Offer.create(:student => @student, :status => "sent", :instructor_accepted => true, :student_accepted => true)
    it "returns false" do
      expect(helper.offerProcessed(offer)).to eq(TRUE)
    end
  end
end
