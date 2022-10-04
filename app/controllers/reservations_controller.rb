class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]



  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.all
    @users = User.all
    @transports = Transport.all


    @time_intervals = %w[
      00:00-01:00
      01:00-02:00
      02:00-03:00
      03:00-04:00
      04:00-05:00
      05:00-06:00
      06:00-07:00
      07:00-08:00
      08:00-09:00
      09:00-10:00
      10:00-11:00
      11:00-12:00
      12:00-13:00
      13:00-14:00
      14:00-15:00
      15:00-16:00
      16:00-17:00
      17:00-18:00
      18:00-19:00
      19:00-20:00
      20:00-21:00
      21:00-22:00
      22:00-23:00
      23:00-00:00
    ]

    end

  def get_value
    puts "hello"
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation  }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end


  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
      # @users = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:user_id, :transport_id, :time)
      # params.require(:user).permit(:name, :user_id)
    end


end
