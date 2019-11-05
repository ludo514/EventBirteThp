class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  	@event = Event.all
  	@user = User.all
  end

  def show
  	@event = Event.find(params[:id])
  end

  def new
  	@event = Event.new
  end

  def create
  	@event = Event.new(administrator_id:current_user.id,start_date: params[:event][:start_date], duration: params[:event][:duration], description: params[:event][:description],title: params[:event][:title], location:params[:event][:location],price: params[:event][:price])

  	if @event.save
  		flash[:sucess] = "Evenement créé"
  		redirect_to '/'
  	else
  		flash[:danger] = "Erreur, evenement non créé"
  		render :new
  	end
  end

end
