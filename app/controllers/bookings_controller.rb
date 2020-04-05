class BookingsController < ApplicationController
    def index
      @decision = Decision.new
      @bookings = Booking.where(user_id: current_user.id).includes(:user).order("created_at DESC")
      today = Date.today  
      @booking = Booking.where(user_id: current_user.id).where("return_day > ?",today).includes(:user).order("created_at DESC")
      @finished = Booking.where(user_id: current_user.id).where("return_day < ?",today).includes(:user).order("created_at DESC")
   
    end
  
    def new
      @booking = Booking.new
    end
  
    def create
      
      @booking = Booking.new(booking_params)
      params[:booking][:departure_day] = departureday
      params[:booking][:return_day] = returnday
      if @booking.save
        redirect_to bookings_path(current_user.id)
      else
        render 'new'

      end
  
    end
  
    def show
      @booking= Booking.find(params[:id])
      @decisions = Decision.where(booking_id:@booking.id)
      @no_decisions = Decision.where(booking_id:@booking.id)
      @decision = @decisions != []
    end
  
  
  
    def edit
    end
  
    def update
    end
  
    def delete
    end

   def issue
     @booking = Booking.find(params[:id])
     @booking[:issue] = issue_params[:issue]
     @booking.save
     flash[:notice ] = "発券依頼しました。発券後の変更・キャンセルは取消し料の対象となります"
   end

  
  
    private
  
      def booking_params
        params.require(:booking).permit(:country,:departure_day,:departure,:destination,:return_day,:hotel,:airline,:remarks,:flight_class,:estimate_id).merge(user_id: current_user.id)
      end
  
      def departureday
        date = params[:booking]["daparture_day(1i)"],params[:booking]["daparture_day(2i)"],params[:booking]["daparture_day(3i)"]
        if date[0].blank? && date[1].blank? && date[2].blank?
          return
        else
          Date.new date[0].to_i,date[1].to_i,date[2].to_i
        end
      end
  
      def issue_params
        params.require(:booking).permit(:issue)
      end

      def returnday
        date = params[:booking]["daparture_day(1i)"],params[:booking]["daparture_day(2i)"],params[:booking]["daparture_day(3i)"]
        if date[0].blank? && date[1].blank? && date[2].blank?
          return
        else
          Date.new date[0].to_i,date[1].to_i,date[2].to_i
        end
      end
  
  end

