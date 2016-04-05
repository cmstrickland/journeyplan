require 'rails_helper'

RSpec.describe "Negotiators", type: :request do
  describe "GET /negotiators" do
    it "works! (now write some real specs)" do
      get negotiators_path
      expect(response).to have_http_status(200)
    end
  end
end
