class ItemPurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:post_code, :prefecture_id, :city, :house_number, :building_name).merge(item_id: item.id)
  end

end
# ItemPurchasesコントローラのindexアクションにどんなparamsが送られてきているか確認する
# （現在params[:id]は送られてきていないので、params[:id]は使えない）

# rails sをしているターミナルを見る
# binding.pryをしてみる

