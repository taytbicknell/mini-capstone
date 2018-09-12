class Api::ProductsController < ApplicationController
  def index
    @products = Product.order(id: :asc)
    if params[:search]
      @products = Product.where("id LIKE ? OR name LIKE ? OR price LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%",)
    end
    render "index.json.jbuilder"
  end

  def create
    @products = Product.create(
    name: params[:name],
    price: params[:price],
    image_url: params[:image_url],
    description: params[:description],
    supplier_id: params[:supplier_id]
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
    @prodcuct.supplier_id = params[:supplier_id]

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
