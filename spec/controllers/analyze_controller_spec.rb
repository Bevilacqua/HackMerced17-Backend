require 'rails_helper'

RSpec.describe AnalyzeController, type: :controller do
  #
  # describe "GET #authors" do
  #   it "requires a list of authors" do
  #     get :authors
  #     expect(response).to have_http_status(400)
  #   end
  #
  #   it "requires all authors to have a last name" do
  #     get :authors, params: {
  #       authors: [
  #         first_name: "John"
  #       ]
  #     }
  #     expect(response).to have_http_status(400)
  #   end
  #
  #   it "does not require an author's first name" do
  #     get :authors, params: {
  #       authors: [
  #         last_name: "Doe"
  #       ]
  #     }
  #     expect(response).to have_http_status(:ok)
  #   end
  # end

  describe "GET determine_most_common" do
    it "requires a list of words to analyze" do
      get :determine_most_common, params: {}
      expect(response).to have_http_status(400)
    end

    it "requiresa word in each entry" do
      get :determine_most_common, params: {
        words: [
            {
              count: 4
            },
            {
              count: 3
            }
        ]
      }
      expect(response).to have_http_status(400)
    end

    it "requiresa count in each entry" do
      get :determine_most_common, params: {
        words: [
            {
              word: "test"
            },
            {
              word: "jacob"
            }
        ]
      }
      expect(response).to have_http_status(400)
    end

    it "returns a status of 200 when the correct entries are provided and solutions found" do
      get :determine_most_common, params: {
        words: [
            {
              word: "test",
              count: 3
            },
            {
              word: "jacob",
              count: 6
            }
        ]
      }
      expect(response).to have_http_status(:ok)
    end

  end

end
