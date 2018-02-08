class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
  	@events = Event.all
  end

	def new
		@event = Event.new
	end

	def create
		@event = current_user.events.new(event_params)
		 if @event.save
    	flash[:success] = "New event: #{@event.title} published ! "
      redirect_to event_path(@event)
    else
    	flash.now[:danger] = @event.errors.full_messages.to_sentence
      render 'new'
    end
	end




	private

# Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

  def event_params
    params.permit(:title, :location, :user_id, :start_date, :end_date) 
  end
end
