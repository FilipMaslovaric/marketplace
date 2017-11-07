class ProductsController < ApplicationController
  include CategoryOptions
  skip_before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @categories = Category.all

    if @product.image == 0
      @image = root_path << "placeholder_images/pillow.jpg"
    else
      @image = Media.find(@product.image).file_name.url
    end

    @quantity = [1,2,3,4,5]

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

  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.shop = current_user.shop

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    session[:cart].delete(params[:product_id])
  end
  
  # DELETE /products/1
  # DELETE /products/1.json
  # def destroy
  #   @product.destroy
  #   respond_to do |format|
  #     format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :image, :sold, :shop_id, :category_id, :about)
    end
end
