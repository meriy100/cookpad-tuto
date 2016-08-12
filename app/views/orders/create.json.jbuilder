json.extract! @order, :id, :ordered_at, :total, :status, :created_at, :updated_at
json.url order_url(@order, format: :json)
json.line_items do
  json.array! @order.line_items do |line_item|
    json.quantity line_item.quantity
    json.subtotal line_item.subtotal
    json.item do
      json.id line_item.item.id
      json.name line_item.item.name
      json.price line_item.item.price
      json.url item_url(line_item.item, format: :json)
    end
  end
end
