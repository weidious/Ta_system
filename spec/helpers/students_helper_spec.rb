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
RSpec.describe StudentsHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "#students_for_select" do
    it "returns students" do
      expect(helper.students_for_select).to eq(Student.all.collect {|s| [ s.fullname, s.id ] })
    end
  end

  describe "#currentStudent" do
    it "returns current students" do
      expect(helper.currentStudent).to eq(Student.find_by_netID(session[:netID]))
    end
  end
end
