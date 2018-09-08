class Api::ProductsController < ApplicationController
  
  def all_products_method 
    @products = Product.all
    render "all_products.json.jbuilder"
  end

  def first_product_method 
    @product = Product.find_by(id: 1)
    render "first_product.json.jbuilder"
  end

  def second_product_method 
    @product = Product.find_by(id: 2)
    render "second_product.json.jbuilder"
  end

  def last_product_method 
    @product = Product.find_by(id: 4)
    render "last_product.json.jbuilder"
  end

  def query_params_method
    input_value = params["message"]
    @message = "Message says #{input_value}"
    render "query_params.json.jbuilder"
  end

  def index
    if params[:search]
      @products = Product.where("name LIKE ?", "%#{params[:search]}%")
    end
    @products = @products.order(id: :asc)
    render "index.json.jbuilder"
  end

  def create
    @products = Product.create(
    name: params[:name],
    price: params[:price],
    image_url: params[:image_url],
    description: params[:description]
    )
    render "show.json.jbuilder"
  end

  def show
    @product = Product.find(params[:id])
    render "show.json.jbuilder"
  end

  def update
    @product = Product.find(params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description

    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_message}, status: :unprocessable_entity
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Product destroyed"}
  end
end
