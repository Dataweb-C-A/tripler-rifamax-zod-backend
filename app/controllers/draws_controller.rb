class DrawsController < ApplicationController
  def index
    @draws = Draw.all

    render json: @draws, status: :ok
  end

  def show
    render json: @draw, status: :ok
  end

  private

  def draws_find
    @draw = Draw.find_by(key: params[:key])
  end
end
