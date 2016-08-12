class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = if params[:category_id].present?
               Category.find(params[:category_id]).items.all
             else
               Item.all
             end
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  def recommended
    @items = Item.where(recommended: true)
    render :index
  end

  def uncategorized
    @items = Item.where(category_id: nil)
    render :index
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end
end
