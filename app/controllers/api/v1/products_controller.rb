class Api::V1::ProductsController < ApplicationController

	def index
		if params[:keywords].present?
			@keywords = params[:keywords]
			#product_search_term = ProductSearchTerm.new(@keywords)
			#@products = Product.where(product_search_term.where_clause, product_search_term.where_args).order(product_search_term.order).limit(10)
			@products = Product.full_text_search(@keywords).fts_ascending.limit(20)
		else
			@products = []
		end
		respond_to do |format|
			format.html {}
			format.json { render json: @products }
		end
	end

	def show
		@product = Product.find(params[:id])
		respond_to do |format|
			format.html {}
			format.json { render json: @product.to_json(include: { company: { only: :name }, source: { only: :location } }) }
		end
	end
end