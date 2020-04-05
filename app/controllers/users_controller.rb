class UsersController < ApplicationController
  before_action :move_to_signin

  def move_to_signin
    redirect_to new_user_session_path unless user_signed_in?
  end

  def index
    @booking = Booking.where(user_id:current_user.id).count
    @estimate = Estimate.where(user_id:current_user.id).count
    @decision = Decision.where(user_id:current_user.id).count
    @expenses = Expense.where(user_id:current_user.id).count
  end

  def show
    todays = Date.today  
    tooday= todays.strftime
    passport = current_user.passport_valid.strftime("%Y年%m月%d日")
    @today = todays.to_date
    passport_valid= Date.strptime(passport,'%Y年%m月%d日')
    @passport_valid =passport_valid.to_date
    zan = @passport_valid - @today
    @zan = zan.to_i

  end

end
