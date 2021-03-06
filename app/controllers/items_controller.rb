class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    binding.pry
    if @item.save
      redirect_to root_path

    else
      render :new

    end
  end

  def show
  end

  def edit
    if current_user.id != @item.user_id
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path

    else
      render 'edit'

    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :deliverycharge_id, :prefecture_id, :daystoship_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
