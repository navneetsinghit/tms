class ProductsController < ApplicationController
	before_action :find_product, only:[:show, :destroy]
  def index
  	@products = Product.all
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		redirect_to products_path
  	else
  		render 'new'
  	end
  end

  def show
  end

  def destroy
  	@product.destroy
  	redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:product_name)
  end
  
  def find_product
    @product = Product.find(params[:id])
  end
end
