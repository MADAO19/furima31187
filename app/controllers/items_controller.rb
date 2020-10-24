class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path

    else
      render :new

    end
  end

  def show
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :deliverycharge_id, :prefecture_id, :daystoship_id, :price, :image).merge(user_id: current_user.id)
  end
end
