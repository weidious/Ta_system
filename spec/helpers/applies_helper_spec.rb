require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the AppliesHelper. For example:
#
# describe AppliesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe AppliesHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "#booleans_for_select" do
    it "returns yes no" do
      expect(helper.booleans_for_select).to eq([["Yes", true], ["No", false]])
    end
  end

  describe "#booleanCaption" do
    it "returns yes" do
      b = 1
      expect(helper.booleanCaption(b)).to eq("Yes")
    end
    it "returns no" do
      b = nil
      expect(helper.booleanCaption(b)).to eq("No")
    end
  end
end
