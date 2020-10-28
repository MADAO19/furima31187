class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @connect = Connect.new
  end

  # def new
  #   @item = Item.find(params[:item_id])
  #   @connect = Connect.new
  # end

  def create
    @item = Item.find(params[:item_id])
    @connect = Connect.new(purchase_params)
# binding.pry
    if @connect.valid?
      pay_item
      @connect.save
      return redirect_to root_path
    else
      render 'index'
    end
    end


    private

    def purchase_params
      params.require(:connect).permit(:postal_code, :prefecture_id, :municipal_district, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
      end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      end

end
