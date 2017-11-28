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
        @offer.status = :available
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
      @offer.status = 'sent'
      @offer.save
      redirect_to admin_offers_path
    end
    
    def student_accept
        @offer = Offer.find(params[:offer_id])
        if (@offer.status == "sent") && (@offer.student_accepted == nil)
            @offer.student_accepted = true
            if @offer.instructor_accepted == true
                @offer.status = "accepted"
            elsif @offer.instructor_accepted == false
                @offer.status = "rejected"
            end
        end
        @offer.save
        redirect_to student_checkStatus_path(@offer.student)
    end
    
    def student_reject
        @offer = Offer.find(params[:offer_id])
        if (@offer.status == "sent") && (@offer.student_accepted == nil)
            @offer.student_accepted = false
            if @offer.instructor_accepted != nil
                @offer.status = "rejected"
            end
        end
        @offer.save
        redirect_to student_checkStatus_path(@offer.student)
    end
    
    def instructor_accept
        @offer = Offer.find(params[:offer_id])
        if (@offer.status == "sent") && (@offer.instructor_accepted == nil)
            @offer.instructor_accepted = true
            if @offer.student_accepted == true
                @offer.status = "accepted"
            elsif @offer.student_accepted == false
                @offer.status = "rejected"
            end
        end
        @offer.save
        #redirect_to student_checkStatus_path(@offer.student)
    end
    
    def instructor_reject
        @offer = Offer.find(params[:offer_id])
        if (@offer.status == "sent") && (@offer.instructor_accepted == nil)
            @offer.instructor_accepted = false
            if @offer.student_accepted != nil
                @offer.status = "rejected"
            end
        end
        @offer.save
        #redirect_to student_checkStatus_path(@offer.student)
    end
    
private
    def offer_params
        params.require(:offer).permit(:course_id, :student_id, :app_type, :student_accepted, :instructor_accepted, :status)
    end
end
