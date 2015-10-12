require 'rails_helper'

RSpec.describe OfficesController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      @office = FactoryGirl.create(:office)
      get :show, id: @office.slug
      expect(response).to have_http_status(:success)
    end
  end

end
