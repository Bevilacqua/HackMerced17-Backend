require 'rails_helper'

RSpec.describe PingController, type: :controller do
  describe "GET hello" do
    it "Should return a 200 OK status" do
      get :hello
      expect(response).to have_http_status(:ok)
    end
  end
end
