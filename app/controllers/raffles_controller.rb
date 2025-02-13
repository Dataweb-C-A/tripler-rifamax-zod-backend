class RafflesController < ApplicationController
  before_action :validates_token, except: %i[index]

  # GET /raffles
  def index
    raffles = Raffle.all
    render json: raffles, status: :ok
  end

  # POST /raffles
  def create
    raffle = Raffle.new(raffle_params)
    if raffle.save
      render json: raffle, status: :created
    else
      render json: { errors: raffle.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /raffles/:id
  def update
    raffle = Raffle.find(params[:id])
    if raffle.update(raffle_params)
      render json: raffle, status: :ok
    else
      render json: { errors: raffle.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /raffles/:id
  def destroy
    raffle = Raffle.find(params[:id])
    raffle.destroy
    render json: raffle, status: :ok
  end

  private

  def raffle_params
    params.require(:raffle).permit(:award_date, :award, :place_id)
  end
end
