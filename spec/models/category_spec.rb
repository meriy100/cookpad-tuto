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

  describe 'has_many :item, learning test' do
    let(:category) { create(:category, name: '調理器具') }

    before do
      category.items.create!(name: '包丁', recommended: true)
      category.items.create!(name: 'フライパン')
    end

    specify {
      expect(category.items.map(&:name)).to match_array(['包丁', 'フライパン'])
    }
    specify { expect(category.items.first.category).to eq(category) }
  end
end
