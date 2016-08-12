# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  status     :integer
#  ordered_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord

  has_many :line_items

  enum status: { checked_out: 1, elce: 2 }



end
