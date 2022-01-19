require 'rails_helper'

RSpec.describe "Averages", type: :request do
  let!(:site) { create(:site, name: 'Gims', auto: 'inactive') }
  let!(:valid_headers) { {} }
  let!(:category) { create(:category, name: 'Healed', site: site) }
  let!(:metric) { create(:metric, value: 20, category: category, created_at: 1.hour.ago) }
  let!(:metric_two) { create(:metric, value: 10, category: category, created_at: 1.minute.ago) }
  let!(:metric_three) { create(:metric, value: 5, category: category, created_at: 24.hour.ago) }
  let!(:metric_four) { create(:metric, value: 20, category: category, created_at: 1.minute.ago) }


  let!(:sites_url) { "/api/v1/sites/#{site.id}/averages" }

  describe 'GET /index' do
    before { get sites_url, headers: valid_headers, as: :json }
    it { expect(response).to be_successful }
    it { expect(response.body).to include("15.0") }
  end
end
