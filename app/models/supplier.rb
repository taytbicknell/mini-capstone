class Supplier < ApplicationRecord
  # def products
  #   Product.where(supplier_id: id) #returns array
  # end
  has_many :products
end
