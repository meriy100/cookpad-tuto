require 'rails_helper'


RSpec.feature "See shop categories", type: :feature do
  scenario 'Listing categories' do
    create(:category, name: "調理器具")
    create(:category, name:  "食器")
    create(:item, name: "包丁", recommended: true)
    create(:item, name: "フライパン")

    visit root_path

    expect(page).to have_text("調理器具")
    expect(page).to have_text("食器")

    expect(page).to have_text('包丁')
    expect(page).not_to have_text('フライパン')
  end

  scenario 'A user can see categorized items from portal', type: :feature do
    kitchenware = create(:category, name: '調理器具')
    kitchenware.items.create!(name: '包丁', recommended: true)
    kitchenware.items.create!(name: 'フライパン')

    tableware   = create(:category, name: '食器')
    tableware.items.create!(name: '大皿')

    visit root_path
    click_on '調理器具'
    expect(page).to have_text('包丁')
    expect(page).to have_text('フライパン')

    expect(page).not_to have_text('大皿')
  end

  scenario 'A user can see uncategorized items from portal', type: :feature do
    kitchenware = create(:category, name: '調理器具')
    kitchenware.items.create!(name: '包丁', recommended: true)
    kitchenware.items.create!(name: 'フライパン')

    tableware   = create(:category, name: '食器')
    tableware.items.create!(name: '大皿')
    Item.create!(name: 'ただのもの')

    visit root_path
    click_on 'uncategorized'
    expect(page).not_to have_text('包丁')
    expect(page).not_to have_text('フライパン')

    expect(page).not_to have_text('大皿')
    expect(page).to have_text('ただのもの')
  end
end


