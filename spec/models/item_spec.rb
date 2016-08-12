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
