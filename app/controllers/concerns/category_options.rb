module CategoryOptions
	extend ActiveSupport::Concern

	included do
		before_action :set_categories
	end

	def set_categories
    	@category_options = Category.all.map{ |category| [ category.name, category.id ] }
	end

end