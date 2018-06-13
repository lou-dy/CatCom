class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @male_bettum = MaleBettum.find(params[:male_bettum_id])
    @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: @male_bettum.price, # amount in cents, again
        currency: "usd",
        source: token,
        receipt_email: @user.email,
        description: params[:stripeEmail]
      )
      if charge.paid
        Order.create(user_id: @user.id, male_bettum_id: @male_bettum.id, total: @male_bettum.price)
      end
    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to male_bettum_path(@male_bettum), alert: "Thank you for your purchase"
  end
end
