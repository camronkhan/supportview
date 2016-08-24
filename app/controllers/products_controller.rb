class ProductsController < ApplicationController

	def index
		if params[:keywords].present?
			@keywords = params[:keywords]
			product_search_term = ProductSearchTerm.new(@keywords)
			@products = Product.where(product_search_term.where_clause, product_search_term.where_args).order(product_search_term.order).limit(10)
		else
			@products = Product.all.limit(10)
		end
	end
end