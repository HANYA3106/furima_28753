class ItemPurchasesController < ApplicationController

  def index
    @purchase = Item_purchase.find(params[:item_id])
    @purchases = Item_purchase.new
  end

  def create
  end

end
