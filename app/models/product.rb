class Product < ApplicationRecord
	belongs_to :company
	belongs_to :source

	scope :fts_ascending,	-> { reorder("products.name ASC") }
	scope :fts_descending,	-> { reorder("products.name DESC") }
	
	include PgSearch
	pg_search_scope :full_text_search,
					against: :name,
					using: {
						trigram: {
							threshold: 0.2	# higher threshold --> more strict --> fewer results (default==0.3)
						}
					},
					ranked_by: ":trigram"
end
