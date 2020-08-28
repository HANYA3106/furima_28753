class ItemsController < ApplicationController

  def index
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if  @item.valid?
        @item.save
        redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end
  
  def show
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :price, :introduction, :item_condition_id, :potage_payer_id, :prefecture_id, :preparation_day_id, :category_id).merge(user_id: current_user.id)
  end
end
