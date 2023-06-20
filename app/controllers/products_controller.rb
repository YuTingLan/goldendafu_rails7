# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :find_product, only: %i[show edit update destroy]

  def index
    @products = Product.order(created_at: :desc)
    @products = Product.all
    @product = Product.new

    # 获取选中的选项值
    selected_filling = params[:filling]

    # 将选项值保存到数据库
    Product.create(filling: selected_filling)
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    
    if @product.save
      redirect_to '/products', notice: "品項新增成功"
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @product.update(product_params)
        redirect_to product_path(@product), notice: '已更新成功'
    else
        render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: '已成功刪除' 
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :inventory_quantity, :description, :image)
  end

  def find_product
    @product =  Product.find(params[:id])
  end

end
