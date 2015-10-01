require 'rails_helper'

RSpec.describe DepartmentsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      @department = FactoryGirl.create(:department)
      get :show, id: @department.slug
      expect(response).to have_http_status(:success)
    end
  end

end
