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

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "create Item" do
    context "vaild attributes" do
      specify {
        Item.create attributes_for(:item, name: "まな板")
        expect(Item.count).to eq 1
      }
    end
    context "invaild attributes" do
      specify {
        Item.create attributes_for(:item, name: "")
        expect(Item.count).to eq 0
      }
    end
  end
end
