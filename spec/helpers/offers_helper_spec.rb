require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the OffersHelper. For example:
#
# describe OffersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe OffersHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @student = Student.create(:uin => 123456789, :last_name => "l", :first_name => 'f', :netID => "n")
    @offer = Offer.create(:student => @student)
    @offer1 = Offer.create()
  end

  describe "#offeredStudentName" do
    it "returns student full name" do
      # student = Student.create(:uin => 123456789, :last_name => "l", :first_name => 'f')
      # offer = Offer.create(:student => student)
      expect(helper.offeredStudentName(@offer)).to include("l")
    end

    it "returns student nothing" do
      # student = Student.create(:uin => 123456789, :last_name => "l", :first_name => 'f')
      # offer = Offer.create(:student => student)
      expect(helper.offeredStudentName(@offer1)).to be_empty
    end
  end

  describe "#offeredStudentUIN" do
    it "returns student uin" do
      # student = Student.create(:uin => 123456789, :last_name => "l", :first_name => 'f')
      # offer = Offer.create(:student => student)
      expect(helper.offeredStudentUIN(@offer)).to eq(123456789)
    end

    it "returns nothing" do
      # student = Student.create(:uin => 123456789, :last_name => "l", :first_name => 'f')
      # offer = Offer.create(:student => student)
      expect(helper.offeredStudentUIN(@offer1)).to be_empty
    end
  end

  describe "#offeredStudentNetID" do
    it "returns student NetID" do
      # student = Student.create(:uin => 123456789, :last_name => "l", :first_name => 'f')
      # offer = Offer.create(:student => student)
      expect(helper.offeredStudentNetID(@offer)).to include("n")
    end

    it "returns nothing" do
      # student = Student.create(:uin => 123456789, :last_name => "l", :first_name => 'f')
      # offer = Offer.create(:student => student)
      expect(helper.offeredStudentNetID(@offer1)).to be_empty
    end
  end
end
