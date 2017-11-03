class MainController < ApplicationController
  include CategoryOptions
  
  def home
  	if (params.has_key?(:category_id))
  		@products = Product.where(category_id: params[:category_id])
  	else
  		@products = Product.all
  		puts "!!!!!"
  	end
  
  	@products.each do |product|
  		if product.image == 0
  			@image = root_path << "placeholder_images/pillow.jpg"
  		else
  			@image = Media.find(product.image).file_name.url
  		end 
  	end

    @categories = Category.all
    
  end
end
