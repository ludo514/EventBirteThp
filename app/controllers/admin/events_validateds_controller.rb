class Admin::EventsValidatedsController < ApplicationController

	def index
		@event = Event.where(validated: nil)
		@eventF = Event.where(validated: false)
		@user = User.all
	end

	def update
		@event = Event.find(params[:id])
		if @event.update(validated: params[:validated])
			redirect_to admin_events_validateds_path
		else
			render :index
		end
	end
end