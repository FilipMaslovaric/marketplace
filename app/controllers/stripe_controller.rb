class StripeController < ApplicationController
  def connect
  	# Stripe brings the user back with an authorization code in the URL
  	code = params[:code]

  	# To finish the OAuth flow, we exchange this code for an access token and stripe user id
  	response = HTTParty.post("https://connect.stripe.com/oauth/token", 
  	  :query => { 
  	    client_secret: ENV.fetch('SECRET_KEY'), 
  	    code: code, 
  	    grant_type: "authorization_code"
  	  }
  	)

    puts response.inspect
    puts "!!!!!!!"

  	if response.parsed_response.key?("error")
      puts "@@@@@"
  	  # Something went wrong. E.g. the code expired
  	  redirect_to current_user.shop, notice: response.parsed_response["error_description"]
  	else
      puts "??????????" + response.parsed_response["stripe_user_id"]
      puts current_user.inspect
  	  # Success! :party_parrot:
  	  current_user.stripe_user_id = response.parsed_response["stripe_user_id"]
  	  current_user.save
  	  redirect_to current_user.shop, notice: 'Successfully connected with Stripe!'
  	end
  end
end
