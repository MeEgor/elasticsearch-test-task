class GoodsController < ApplicationController
  def index
    @goods = Good.search params[:q]
  end

  def new
    @good = Good.new
  end

  def create
    @good = Good.new permited_params
    if @good.save
      redirect_to goods_path
    else
      render :new
    end
  end

  def destroy
    @good = Good.find params[:id]
    if @good.destroy
      redirect_to goods_path
    else
      redirect_to goods_path
    end
  end

  private
    def permited_params
      params.require(:good).permit(:article, :name)      
    end
end
