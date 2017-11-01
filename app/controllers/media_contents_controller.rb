class MediaContentsController < ApplicationController
	def create
	  @media = Media.new(file_name: params[:file])
	  	puts "!!!!!"
	  	puts params.inspect
	  
	  if @media.save
	  	
	  	shop = Shop.find_by_user_id(current_user.id)
	  	if request.headers["image-position"] == 'logo'
	  		shop.logo = @media.id
	  	elsif request.headers["image-position"] == 'background'
	  		shop.background_image = @media.id
	  	end
	  	shop.save
	  	

	  	product = Product.find(request.headers["product-id"])

	  	if request.headers["image-position"] == 'product'
	  		product.image = @media.id
	  	end
	  	product.save
	    
	    respond_to do |format|
	      format.json{ render :json => @media }
	    end
	  end
	end
end
