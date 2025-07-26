class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).active
    @categories = Category.all
    
    # Hierarchical search by category
    if params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
    end
    
    # Simple search functionality 
    if params[:search].present?
      @products = @products.where("name LIKE ? OR description LIKE ?", 
                                  "%#{params[:search]}%", "%#{params[:search]}%")
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    redirect_to products_path(search: params[:search], category_id: params[:category_id])
  end
end