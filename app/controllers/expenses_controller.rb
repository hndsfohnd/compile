class ExpensesController < ApplicationController
  def index
    @expenses = Decision.where(approval:1)
    today = Date.today  
    @bookings = Booking.where(user_id: current_user.id)
    @expense = Expense.where(user_id: current_user.id).includes(:booking)
    @return_home = Booking.left_joins(:expenses).select(:id,:departure_day,:destination,:return_day).where("booking_id is null").where("return_day <?",today)
  end
  def new 
    @expense = Expense.new
    @expense.receipts.build
  end

  def create
    @expense = Expense.new(expense_params)
    add_booking = add_booking_id[:booking_id]
    @expense[:booking_id] = add_booking
      if @expense.save
        params[:receipts][:image].each do |image|
          @expense.receipts.create(image: image)

          
      end
        redirect_to expenses_path
      else
        render "new"
    end
  end

  private
    def expense_params
      params.require(:expense).permit(:application_date, :travel_cost, :approver,:approval, receipts_attributes: [:image]).merge(user_id: current_user.id)
    end

    def add_booking_id
      params.permit(:booking_id)
    end
 

    
end
