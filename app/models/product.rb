class Product < ApplicationRecord
  
  # def supplier
  #   Supplier.find_by(id: supplier_id) #find_by returns hash
  # end

  belongs_to :supplier
  has_many :images 
  has_many :orders

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { in: 2..40 }
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
