class CheckoutController < ApplicationController
  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    puts @session

    if @session.payment_intent.present?
      @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
      # @event_id = @session.metadata.event_id
    else
      # Gérez le cas où `payment_intent` est manquant
      flash[:alert] = "Le paiement n'a pas pu être récupéré."
      redirect_to root_path
    end
  end

  def cancel
  end
end
