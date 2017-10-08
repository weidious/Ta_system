class WelcomeController < ApplicationController
  def index
    render layout: false
  end

  def login
    #verify the user first in the next step
    @UIN = params[:student][:UIN]
    redirect_to controller: 'students', action: 'index', UIN: @UIN
  end
end
