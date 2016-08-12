# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  item_id    :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_line_items_on_item_id   (item_id)
#  index_line_items_on_order_id  (order_id)
#
# Foreign Keys
#
#  fk_rails_2dc2e5c22c  (order_id => orders.id)
#  fk_rails_d159f7f5fb  (item_id => items.id)
#

class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
end
