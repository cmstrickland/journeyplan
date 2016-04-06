class JourneysController < ApplicationController
  before_action :set_journey, only: [:show, :edit, :update, :destroy]

  # GET /journeys
  def index
    @journeys = Journey.all
  end

  # GET /journeys/1
  def show
  end

  # GET /journeys/new
  def new
    if needs_negotiators?
      redirect_to new_negotiator_url, notice: 'The system needs at least one negotiator to plan journeys'
    else
      @journey = Journey.new
    end
  end

  # GET /journeys/1/edit
  def edit
  end


  # POST /journeys
  def create
    negotiator = Negotiator.find_by_id(journey_params[:negotiator_id])

    @journey = Journey.new(negotiator: negotiator, starts: journey_params[:starts])
    @journey.locations = journey_params[:locations]
    if @journey.save and @journey.build_visits
      redirect_to @journey, notice: 'Journey was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /journeys/1
  def update
    if @journey.update(journey_params)
      redirect_to @journey, notice: 'Journey was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /journeys/1
  def destroy
    @journey.destroy
    redirect_to journeys_url, notice: 'Journey was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journey
      @journey = Journey.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def journey_params
      params.require(:journey).permit(:locations,:starts,:negotiator_id)
    end
end
