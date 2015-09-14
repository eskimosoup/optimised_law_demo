require 'rails_helper'

RSpec.describe ServiceCategoriesController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      @service_category = FactoryGirl.create(:service_category)
      get :show, id: @service_category.slug
      expect(response).to have_http_status(:success)
    end
  end

end
