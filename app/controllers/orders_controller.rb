class OrdersController < ApplicationController
  before_action :set_order

  def show
  end

  def create
    @order = Order.new
    @order.line_items.new params[:line_items]

    if @order.save
      redirect_to order_path(@order)
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end


  # つかわない
  def order_params
    params.require (:order).permit(
      :id, :status, :ordered_at,
      line_items_attributes: [
        :id, :item_id, :quantity
      ]
    )
  end

end
