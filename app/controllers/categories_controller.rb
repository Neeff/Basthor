class CategoriesController < ApplicationController
  def create
    @category = Category.new(name: params[:name], shop_id: params[:id])
    @shop = Shop.find(params[:id])
    respond_to do |format|
      if @category.save
        format.html { redirect_to shop_path(@shop), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @category = Category.find(params[:id])
    @products_category = @category.products
  end
 
end
