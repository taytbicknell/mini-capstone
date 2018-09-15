class Api::ProductsController < ApplicationController
  
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all
    
    if params[:search]
      @products = Product.where("id LIKE ? OR name LIKE ? OR price LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%",)
    end
    
    if params[:price_sort]
      @products = @products.order(price: :asc)
    else 
      @products = @products.order(id: :asc)
    end
    
    render "index.json.jbuilder"
  end

  def create
    @product = Product.new(
    name: params[:name],
    price: params[:price],
    description: params[:description]
    )
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_message}, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
    render "show.json.jbuilder"
  end

  def update
    @product = Product.find(params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
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