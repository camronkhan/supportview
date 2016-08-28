class Product < ApplicationRecord
	belongs_to :company
	belongs_to :source
end
