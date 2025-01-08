class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all

    render json: @schedules, status: :ok
  end

  def show
    render json: @schedule, status: :ok
  end

  private

  def schedule_find
    @schedule = Schedule.find(params[:id])
  end
end
