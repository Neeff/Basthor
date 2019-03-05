class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show]

  def create
    @category = Category.new(category_params)
    @shop = Shop.find(params[:category][:shop_id])
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
    @products_category = @category.products
  end

  private

  def category_params
    params.require(:category).permit(:name, :shop_id, :image)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
