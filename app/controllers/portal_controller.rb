class PortalController < ApplicationController

  def show
    @categories = Category.all
    @items = Item.where recommended: true
  end
end
