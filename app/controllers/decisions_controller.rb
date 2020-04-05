class DecisionsController < ApplicationController
  def index
    @book = Booking.new
    @decisions = Decision.where(user_id: current_user.id).includes(:user).order("created_at DESC")
    @bookings = Booking.where.not(flight_rate: nil)
    @estimates = Estimate.where.not(flight_rate: nil)
    @no_decision = Booking.left_joins(:decision).select(:id,:destination,:departure_day,:policy).where("booking_id is null").where.not(flight_rate: nil)
    @no_decisions = Estimate.left_joins(:decision).select(:id,:destination,:departure_day,:policy).where("estimate_id is null").where.not(flight_rate: nil)

  end
  def new
    @decision = Decision.new
    
  end
  def create
    @decision = Decision.new(decision_params)
    params[:application_date] = application_day 
    if @decision.save
      redirect_to decisions_path
    else
      render "new"
    end    
  end
  def show
    @decision = Decision.find(params[:id])

  end
  

  private
  
    def decision_params
      params.permit(:title,:purpose,:rate,:application_date,:booking_id,:estimate_id).merge(user_id: current_user.id)
    end

    def application_day
      date = params["application_date(1i)"],params["application_date(2i)"],params["application_date(3i)"]
        if date[0].blank? && date[1].blank? && date[2].blank?
        return
      else
        Date.new date[0].to_i,date[1].to_i,date[2].to_i
      end
    end


end
