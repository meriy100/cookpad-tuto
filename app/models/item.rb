# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  price       :integer
#  image_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  recommended :boolean          default(FALSE), not null
#  category_id :integer
#
# Indexes
#
#  index_items_on_category_id  (category_id)
#

class Item < ApplicationRecord

  belongs_to :category, optional: true

  validates :name, presence: true
end
