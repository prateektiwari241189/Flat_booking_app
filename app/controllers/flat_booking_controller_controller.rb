class FlatBookingControllerController < ApplicationController


	before_action :set_booking, only: [:show, :edit]


	def index
		render 'flat_booking_controller/index'
		@bookings = FlatBooking.all
	end

	# def list
 #      @employees = Employee.all
	# end

   def show
      @booking
   end
  
   def new
      byebug
      @bookings = FlatBooking.new
      get_bookings
   end

   def create
      byebug
      @booking = FlatBooking.new(booking_params)
      
      if @booking.save
        redirect_to @booking 
      else
        render 'index'
      end
   end

   def generate_monthly_report

   end

   def generate_report_yearly
    byebug
    @booking_year = params[:flat_booking_report][:year]
    @bookings_in_year = FlatBooking.all.where('extract(year  from date_of_booking) = ?', @booking_year)
    @total_agreement_amount = []
    @final_array = @total_agreement_amount.reject{|s| s.to_s ==''}
    @agreement_amount_total = @final_array.sum
    @bookings_in_year.each do |booking|
      @total_amount = booking.agreement_amount
      @total_agreement_amount << @total_amount
    end
  end

    def generate_report_monthly
      byebug
      @booking_year = params[:flat_booking_report][:year]
      @booking_month = params[:flat_booking_report][:month]
      @bookings_in_month = FlatBooking.all.where('extract(year from date_of_booking) =? and extract(month from date_of_booking) =?', @booking_year,@booking_month)
      @total_agreement_amount = []
      @final_array = @total_agreement_amount.reject{|s| s.to_s ==''}
      @agreement_amount_total = @final_array.sum
      @bookings_in_month.each do |booking|
      @total_amount = booking.agreement_amount
      @total_agreement_amount << @total_amount
    end
   end

   def generate_yearly_report

   end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = FlatBooking.find(params[:id])
    end

   
    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:flat_booking).permit(:title, :id, :base_price,:date_of_booking,:agreement_amount,:area)
    end

    def year_params
      params.require(:flat_booking_report).permit(:year)
    end

    def month_params
      params.require(:flat_booking_report).permit(:year,:month)
    end

end
