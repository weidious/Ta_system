class OfferDecisionController < ApplicationController

  def decide
    render layout: false
    
  end
  
  def accept
    flash[:notice] = "accepted"
    redirect_to offer_decision_thankyou_path
  end
  
  def reject
    flash[:notice] = "rejected"
    redirect_to offer_decision_thankyou_path
  end
  
  def thankyou
    render layout: false
  end
  
end
