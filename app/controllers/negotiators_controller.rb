class NegotiatorsController < ApplicationController
  before_action :set_negotiator, only: [:show, :edit, :update, :destroy]

  # GET /negotiators
  def index
    @negotiators = Negotiator.all
  end

  # GET /negotiators/1
  def show
  end

  # GET /negotiators/new
  def new
    @negotiator = Negotiator.new
  end

  # GET /negotiators/1/edit
  def edit
  end

  # POST /negotiators
  def create
    @negotiator = Negotiator.new(negotiator_params)

    if @negotiator.save
      redirect_to @negotiator, notice: 'Negotiator was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /negotiators/1
  def update

    if negotiator_params.any? and @negotiator.update(negotiator_params)
      redirect_to @negotiator, notice: 'Negotiator was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /negotiators/1
  def destroy
    @negotiator.destroy
    redirect_to negotiators_url, notice: 'Negotiator was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_negotiator
      @negotiator = Negotiator.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def negotiator_params
      params.require(:negotiator).permit(:username)
    end
end
