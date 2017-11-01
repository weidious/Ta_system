class WelcomeController < ApplicationController
  def index
    render layout: false
  end

  def login
    #verify the user first in the next step
    #session[:student_uin] = params[:uin]
    
    session[:user_type] = params[:usertype]
    
    case session[:user_type]
    when "Student"
      session[:student_uin] = params[:uin]
      redirect_to controller: 'students', action: 'index'
    when "Admin"
      session[:admin_uin] = params[:uin]
      redirect_to controller: 'courses', action: 'index'
    when "Instructor"
      session[:instructor_uin] = params[:uin]
      redirect_to controller: 'courses', action: 'index'
    else
      redirect_to controller: 'welcome', action: 'index'
    end
    # @UIN = params[:student][:UIN]
  end
    
    
end
