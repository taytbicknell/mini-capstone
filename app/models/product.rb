class Product < ApplicationRecord
  
#   1. In the Product model, make a `supplier` method to get the associated supplier. Test the code in the rails console with something like:
# ```product = Product.first
# product.supplier```
# 2. Change your app to show the supplier’s info with each product.

  def supplier
    Supplier.find_by(id: supplier_id) #find_by returns hash
  end

  validates :name, length: {maximum: 40}
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :price, uniqueness: true
  validates :description, length: { in: 6..500 }


  def is_discounted?
    price <= 25
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
