class ResultsController < ApplicationController
  def index
    @results = ActiveModel::SerializableResource.new(Result.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day))

    render json: {
      filter_by: 'Daily',
      current_date: Time.now.strftime('%d/%m/%Y'),
      current_time: Time.now.strftime('%I:%M %p'),
      results: @results
    }, status: :ok
  end

  def weekly
    @results = ActiveModel::SerializableResource.new(Result.where(created_at: (Time.zone.now - 7.days).beginning_of_day..Time.zone.now.end_of_day))

    render json: {
      filter_by: 'Weekly',
      current_date: Time.now.strftime('%d/%m/%Y'),
      current_time: Time.now.strftime('%I:%M %p'),
      results: @results
    }, status: :ok
  end

  def show
    render json: @result, status: :ok
  end

  private

  def results_find
    @result = Result.where(params[:id])
  end
end
