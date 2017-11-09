class CartController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @total = 0

    if !session[:cart].nil?
      session[:cart].each do |product_id, item|
        @product = Product.find(product_id)
        @total = @total + @product.price * item["quantity"]
      end
    end


    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    # charge = Stripe::Charge.create(
    #   :customer    => customer.id,
    #   :amount      => @total,
    #   :description => 'Rails Stripe customer',
    #   :currency    => 'aud'
    # )



    @sellers = {}
    session[:cart].each do |product_id, item|
      product = Product.find(product_id)

      # @seller = {
      #   :shop_id  => product.shop.user.stripe_user_id,
      #   :amount   => product.price * item["quantity"]
      # }

      stripe_account = product.shop.user.stripe_user_id

      if !@sellers.key?(stripe_account)
        @sellers[stripe_account] = 0
      end

      @sellers[stripe_account] += product.price * item["quantity"]
      
    end

    @sellers.each do |stripe_account, amount|

      # Stripe::Payout.create(
      # {
      #   :amount => (amount * 100 * 0.8).to_i,
      #   :currency => "aud"
      #   },
      #     {:stripe_account => stripe_account}
      # )

      @charge = Stripe::Charge.create({
        :customer => customer.id,
        :amount => amount.to_i,
        :currency => "aud",
        :destination => {
          :amount   => (amount * 0.8).to_i,
          :account  => stripe_account,
        }
      })

    end



    email = customer.email
    PurchaseMailer.confirm_purchase(email, @total).deliver_now


    order = Order.create(
        :order_details  => @charge
      )

    session[:cart].each do |product_id, item|
      product = Product.find(product_id)
      order_products = OrderProduct.create(
        :price          => product.price,
        :quantity       => item["quantity"],
        :product_id     => product.id,
        :order_id       => order.id
      )
    end

    session.delete(:cart)

    redirect_to root_path, notice: "Congratulations on your purchase, your card has been charged #{view_context.number_to_currency(@total.to_d / 100)}"

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to shops_path
  end

  def show
    @cart = []

    @total = 0


   	if !session[:cart].nil?
      session[:cart].each do |product_id, item|
     		product = Product.find(product_id)
        cart_products = { 
     			:product => product, 
     			:quantity => item["quantity"]
     		}

     	  @cart.push(cart_products)

        @total = @total + product.price * item["quantity"]
     	end
    end
    puts "@@@@@@"
    puts session[:cart].inspect
  end

  def destroy
    session[:cart].delete(params[:product_id])
    redirect_to cart_path
  end

  def edit
  end

  def add
  	if session[:cart].nil?
  		session[:cart] = {}
  	end

  	current_quantity = 0

  	session[:cart].each do |product_id, item|
  		if params[:product_id] == product_id
  			current_quantity = item["quantity"]
		  end
  	end

  	product = {
  		:quantity => params[:quantity].to_i + current_quantity
  	}

  	session[:cart][params[:product_id]] = product

    redirect_to root_path, notice: "Item added to cart" 

  end
end
