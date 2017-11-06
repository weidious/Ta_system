class OffersController < ApplicationController
    def index
        @course = Course.find(params[:course_id])
        @offers = @course.offers
    end
    
    def new
        @course = Course.find(params[:course_id])
        @offer = @course.offers.new
    end

    def edit
        @course = Course.find(params[:course_id])
        @offer = Offer.find(params[:id])
    end

    def create
        @course = Course.find(params[:course_id])
        @offer = @course.offers.new(offer_params)
        if @offer.save
          flash[:notice] = "Offer was successfully saved."
          redirect_to course_offers_path
        else
          flash[:error] =  @offer.errors.messages
          render 'new'
        end
    end

    def update
        @course = Course.find(params[:course_id])
        @offer = Offer.find(params[:id])
        if @offer.update(offer_params)
          flash[:notice] = "Offer was successfully updated."
          redirect_to course_offers_path
        else
          flash[:error] =  @offer.errors.messages
          render 'edit'
        end
    end

    def destroy
        @course = Course.find(params[:course_id])
        @offer = Offer.find(params[:id])
        @offer.destroy
        redirect_to course_offers_path
    end

    def send_email
      flash[:notice] = params[:offer_id]
      @offer = Offer.find(params[:offer_id])
      @user = @offer.student
      flash[:notice] = @user.email
      OfferMailer.welcome_email(@offer).deliver_later
      redirect_to admin_offers_path
    end
    
private
    def offer_params
        params.require(:offer).permit(:course_id, :student_id, :app_type, :student_accepted, :instructor_accepted)
    end
end
