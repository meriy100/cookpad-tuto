class LineItemsController < ApplicationController

  def create
    @line_item = LineItem.new line_item_params
    @line_item.build_order(ordered_at: Time.zone.now, status: :checked_out)
    if @line_item.save
      redirect_to order_path(@line_item.order)
    end
  end

  private

  def line_item_params
    params.require(:line_item).permit(
      :id, :item_id, :quantity
    )
  end

end
