class WelcomeController < ApplicationController
  def index
    render layout: false
  end

  def login
    #verify the user first in the next step
    #session[:student_uin] = params[:uin]
    session[:user_type] = params[:usertype]
    if session[:user_type] == "Student"
      session[:student_uin] = params[:uin]
      redirect_to controller: 'students', action: 'index'
    elsif session[:user_type] == "Admin"
      session[:admin_uin] = params[:uin]
      redirect_to controller: 'courses', action: 'index'
    elsif session[:user_type] == "Instructor"
      session[:instructor_uin] = params[:uin]
      redirect_to controller: 'courses', action: 'index'
    end
    # @UIN = params[:student][:UIN]

  end
end
