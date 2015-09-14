require 'rails_helper'

RSpec.describe ServicesController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      @service = FactoryGirl.create(:service)
      get :show, id: @service.slug
      expect(response).to have_http_status(:success)
    end
  end

end
