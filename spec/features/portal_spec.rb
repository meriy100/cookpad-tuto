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
end


