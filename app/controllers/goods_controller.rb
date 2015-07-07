class GoodsController < ApplicationController
  def index
    @goods = Good.search params[:q]
  end

  def create
  end

  def destroy
  end
end
