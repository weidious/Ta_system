class StudentsController < ApplicationController

  def index

  end

  def new

  end

  def checkStatus

  end

  def apply

  end

  def create
    render plain: params[:student].inspect
  end
end
