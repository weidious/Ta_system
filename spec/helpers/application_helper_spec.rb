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

module SpecTestHelper
  def set_session
    session[:user_type] = "Admin"
  end
end

RSpec.configure do |config|
  config.include SpecTestHelper, type: :controller
end


RSpec.describe ApplicationHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "#usernav" do
    it "returns students" do
      expect(helper.usernav).to eq("layouts/nonemenu")
    end
  end

end
