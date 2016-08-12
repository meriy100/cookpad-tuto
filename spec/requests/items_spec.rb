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

RSpec.describe "Items", type: :request do
  describe "GET /items" do
    it "works! (now write some real specs)" do
      get items_path
      expect(response).to have_http_status(200)
    end
  end
end
