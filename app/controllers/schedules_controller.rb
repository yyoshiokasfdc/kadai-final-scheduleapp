class SchedulesController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  
  def index
    @schedules = Schedule.all
    @pagy, @schedules = pagy(Schedule.order(id: :desc), items: 5)
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)

    if @schedule.save
      flash[:success] = '予定が作成されました。'
      redirect_to @schedule
    else
      flash.now[:danger] = '情報に不足があります。'
      render :new
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      flash[:success] = '予定が更新されました'
      redirect_to root_url
    else
      flash.now[:danger] = '予定が更新されませんでした'
      render :edit
    end
  end

  def destroy
    @schedule.destroy

    flash[:success] = '予定は削除されました'
    redirect_to root_url
  end
  
  private
  
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
  
  private
  
  def schedule_params
    params.require(:schedule).permit(:content, :start_time, :end_time)
  end
  
  def correct_user
    @schedule = current_user.schedules.find_by(id: params[:id])
    unless @schedule
      redirect_to root_url
    end
  end
end
