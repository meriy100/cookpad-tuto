class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def show
  end

  def create
    @order = Order.new(status: :checked_out)
    @order.line_items.new line_items_params
    @order.save
    render :create, status: 201
    # リダイレクトはしないかんじで
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def line_items_params
    params.require(:line_items).map do |line_item|
      line_item.permit(
        :item_id, :quantity
      )
    end
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
