class ItemsController < ApplicationController
  before_action :set_params, only: [:edit, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    if item.valid?
      item.update(item_params)
      redirect_to item_path, method: :get
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    item = Item.find(params[:id])
    if item.valid?
      item.destroy
      redirect_to root_path, method: :get
    else
      render 'show'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :introduction, :item_condition_id, :potage_payer_id, :prefecture_id, :preparation_day_id, :category_id).merge(user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:id])
  end
end
