class OrderController < ApplicationController
  def new
  end

  def create
    filtered_params = params.except(:authenticity_token, :total)

    @total = params[:total].to_d
    @event_id = params[:event_id]

    @session = Stripe::Checkout::Session.create(
      payment_method_types: [ "card" ],
      line_items: [
        {
          price_data: {
            currency: "eur",
            unit_amount: (@total*100).to_i,
            product_data: {
              name: "Rails Stripe Checkout"
            }
          },
          quantity: 1
        },
        metadata: {
        # event_id: @event_id
      }

      ],
      mode: "payment",

      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url
    )

    redirect_to @session.url, allow_other_host: true
  end
end
