class Product < ApplicationRecord
  
# Name: 
# length maximum 40
# Uniqueness true

# Price:
# Presence true
# Numericality true
# Not a negative number or 0

# Image_url:
# Presence true

# Description: 
# Length between 6 - 500 characters

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
