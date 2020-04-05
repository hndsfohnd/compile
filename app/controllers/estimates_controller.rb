class EstimatesController < ApplicationController
  
  def index
    @estimates = Estimate.where(user_id: current_user.id).includes(:user).order("created_at DESC")

  end

  def new
    @estimate = Estimate.new
  end

  def create
    
    @estimate = Estimate.new(estimate_params)
    params[:estimate][:departure_day] = departureday
    params[:estimate][:return_day] = returnday
    if @estimate.save
      redirect_to estimates_path
    else
      render "new"
    end

  end

  def show
    @estimate = Estimate.find(params[:id])

  end



  def edit
  end

  def update
  end

  def delete
  end


  private

    def estimate_params
      params.require(:estimate).permit(:country,:departure_day,:departure,:destination,:return_day,:hotel,:airline,:remarks,:flight_class).merge(user_id: current_user.id)
    end

    def departureday
      date = params[:estimate]["daparture_day(1i)"],params[:estimate]["daparture_day(2i)"],params[:estimate]["daparture_day(3i)"]
      if date[0].blank? && date[1].blank? && date[2].blank?
        return
      else
        Date.new date[0].to_i,date[1].to_i,date[2].to_i
      end
    end

    def returnday
      date = params[:estimate]["daparture_day(1i)"],params[:estimate]["daparture_day(2i)"],params[:estimate]["daparture_day(3i)"]
      if date[0].blank? && date[1].blank? && date[2].blank?
        return
      else
        Date.new date[0].to_i,date[1].to_i,date[2].to_i
      end
    end

end
