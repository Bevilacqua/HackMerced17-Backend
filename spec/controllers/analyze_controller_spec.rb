require 'rails_helper'

RSpec.describe AnalyzeController, type: :controller do

  describe "GET #authors" do
    it "requires a list of authors" do
      get :authors
      expect(response).to have_http_status(400)
    end

    it "requires all authors to have a last name" do
      get :authors, params: {
        authors: [
          first_name: "John"
        ]
      }
      expect(response).to have_http_status(400)
    end

    it "does not require an author's first name" do
      get :authors, params: {
        authors: [
          last_name: "Doe"
        ]
      }
      expect(response).to have_http_status(:ok)
    end
  end

end
