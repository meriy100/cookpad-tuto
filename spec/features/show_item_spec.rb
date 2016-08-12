require 'rails_helper'

RSpec.feature "See shop items", type: :feature do
  scenario 'A user can see vairous items' do
    create(:item, name: "包丁")
    create(:item, name: "フライパン")
    visit items_path
    expect(page).to have_text('包丁')
    expect(page).to have_text('フライパン')
  end

  scenario 'A user can see recomended items' do
    create(:item, name: "包丁", recomended: true)
    create(:item, name: "フライパン", recomended: true)
    visit recomended_items_path
    expect(page).to have_text('包丁')
    expect(page).to have_no_text('フライパン')
  end
end

