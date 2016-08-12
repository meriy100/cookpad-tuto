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

require "rails_helper"

RSpec.describe ItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/items").to route_to("items#index")
    end

    it "routes to #new" do
      expect(:get => "/items/new").to route_to("items#new")
    end

    it "routes to #show" do
      expect(:get => "/items/1").to route_to("items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/items/1/edit").to route_to("items#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/items").to route_to("items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/items/1").to route_to("items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/items/1").to route_to("items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/items/1").to route_to("items#destroy", :id => "1")
    end

  end
end
