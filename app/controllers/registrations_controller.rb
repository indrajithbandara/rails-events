class RegistrationsController < ApplicationController

	def create
		@registration = Registration.new(params[:user_id][:event_id])


		debugger

	end

end