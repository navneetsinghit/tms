class WeekController < ApplicationController
  #load_and_authorize_resource
  before_action :find_week, only:[:show, :destroy]
  before_action :must_be_manager
  def index
  	@weeks = Week.all
  end

  def new
  	@week = Week.new
  end

  def create
  	@week = Week.new(week_params)
  	# @week.start_date = params:start_date
  	# @week.end_date = :end_date
  	print "Printing start date #{@week.start_date} end date#{@week.end_date}"
  	if(@week.save)
  		redirect_to week_index_path
  	else
  		render 'new'
  	end
  end

  def show

  end

  def destroy
  	@week.destroy
  	redirect_to week_index_path
  end
private
  def must_be_manager
    unless current_user && current_user.has_role?(:manager)
      redirect_to root_path, notice: "Not a manager"
    end
  end

  def week_params
    params.require(:week).permit(:end_date,:start_date)
  end
  
  def find_week
    @week = Week.find(params[:id])
  end
end
