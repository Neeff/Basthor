class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @shop = Shop.find(params[:shop_id])
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @shop = Shop.find(params[:shop_id])
  end

  # GET /products/new
  def new
  end

  # GET /products/1/edit
  def edit
    @shop = Shop.find(params[:shop_id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.shop_id = params[:shop_id]

    respond_to do |format|
      if @product.save
        format.html { redirect_to shop_product_path(params[:shop_id],@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    parameters = params[:search]
    if parameters.blank?
      @products = Product.all
      respond_to :js
    elsif parameters.nil?
      @products = Product.all
      respond_to :js
    else
      @products = Product.where('name LIKE ?',"%#{parameters}%")
      respond_to :js
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end
    # Never trust parameters from the scary internet, only allow the white list through.

  def product_params
    params.require(:product).permit(:name, :price, :description, :shop_id, :category_id, images: [])
  end
end
