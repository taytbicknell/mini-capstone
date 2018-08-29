class Api::ProductsController < ApplicationController
  
  def all_products_method 
    @products = Product.all
    render "all_products.json.jbuilder"
  end

  def first_product_method 
    @product = Product.find_by(id: 1)
    render "first_product.json.jbuilder"
  end
end
