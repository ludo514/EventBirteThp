class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  	@event = Event.where(validated: true)
  	@user = User.all
  end

  def show
  	@event = Event.find(params[:id])
  	@attendances = Attendance.all
  end

  def new
  	@event = Event.new
  end

  def create
  	@event = Event.new(administrator_id:current_user.id,start_date: params[:event][:start_date], duration: params[:event][:duration], description: params[:event][:description],title: params[:event][:title], location:params[:event][:location],price: params[:event][:price])
    @event.avatar.attach(params[:event][:avatar])

  	if @event.save
  		flash[:sucess] = "Evenement créé"
  		redirect_to event_path(@event.id)
  	else
  		flash[:danger] = "Erreur, evenement non créé"
  		render :new
  	end
  end

  def destroy
  	@event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

end
