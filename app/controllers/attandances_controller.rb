class AttendancesController < ApplicationController
	def new
		@concert = Concert.attendees.new
	end

	def create
    @concert = Concert.find_by(id: params[:concert_id])
    current_user.concerts << @concert
    respond_to do |format|
      format.html { redirect_to concert_path(concert) }
      format.js
    end
  end
end
