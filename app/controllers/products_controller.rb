class ProductsController < ApplicationController
  load_and_authorize_resource
	before_action :find_product, only:[:show, :destroy]
  before_filter :must_be_manager
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
    #binding.pry
    @product.destroy
    #@competencies = find_competencies
    #@competencies.destroy_all
  	redirect_to products_path
  end

private
  def must_be_manager
    unless current_user && current_user.has_role?(:manager)
      redirect_to root_path, notice: "Not a manager"
    end
  end

  def product_params
    params.require(:product).permit(:product_name)
  end
  
  def find_product
    @product = Product.find(params[:id])
  end

  def find_competencies
    @competencies = Competency.where(product_id: [params[:id]])
  end
end
