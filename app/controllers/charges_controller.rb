class ChargesController < ApplicationController
  def new
  	@event = Event.find(params[:id])
  	@attendance = Attendance.new
  end

  def create
  	  @event = Event.find(params[:event_id])
  	  @amount = @event.price * 100

	  customer = Stripe::Customer.create({
	    email: params[:stripeEmail],
	    source: params[:stripeToken],
	  })

	  charge = Stripe::Charge.create({
	    customer: customer.id,
	    amount: @amount,
	    description: 'Rails Stripe customer',
	    currency: 'eur',
	  })
	  if charge
	  	@attendance = Attendance.create(strip_customer_id: customer.id,user: current_user, event: @event)
	  	flash[:sucess] = "Inscription à l'événement payer"
	  	redirect_to event_path(@event.id)
	  end

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path(@evetn.id)
   end
end
