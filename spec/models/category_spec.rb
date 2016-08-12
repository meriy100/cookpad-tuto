require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "create Category" do
    context "vaild attributes" do
      specify {
        Category.create attributes_for(:category)
        expect(Category.count).to eq 1
      }
    end
    context "invaild attributes" do
      specify {
        Category.create attributes_for(:category, name: "")
        expect(Category.count).to eq 0
      }
    end
  end
end
