class EventsController < ApplicationController

	def new 
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:notice] = "Happy hour has been added."
			redirect_to '/'
		else
			flash[:alert] = "Happy hour has not been added."
			redirect_to '/'
		end
	end

	private

	def event_params
		params.require(:event).permit(:name, :description, :date, :location, :address)
	end

end