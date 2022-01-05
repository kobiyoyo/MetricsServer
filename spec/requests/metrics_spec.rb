require 'rails_helper'
RSpec.describe '/metrics', type: :request do
  let!(:site) { create(:site, name: 'Gims', auto: 'inactive') }
  let!(:category) { create(:category, name: 'Healed', site: site) }
  let!(:valid_attributes) { { value: 43, category_id: category.id } }
  let!(:invalid_attributes) { { value: '', category_id: category.id } }
  let!(:valid_headers) { {} }
  let!(:sites_url) { "/api/v1/sites/#{site.id}/metrics" }
  let!(:metrics_url) { '/api/v1/metrics' }
  let!(:metric) { create(:metric, value: 21, category: category) }
  let!(:metric_two) { create(:metric, value: 65, category: category) }

  describe 'GET /index' do
    before { get sites_url, headers: valid_headers, as: :json }
    it { expect(response).to be_successful }
    it { expect(response.body).to include('65') }
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      before { post metrics_url, params: valid_attributes, headers: valid_headers, as: :json }
      it { expect(response).to have_http_status(:created) }
      it { expect(response.body).to include('43') }
    end

    context 'with invalid parameters' do
      before { post metrics_url, params: invalid_attributes, headers: valid_headers, as: :json }
      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(response.body).to include("can't be blank") }
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { { value: 32, category_id: category.id } }
      before { patch "#{metrics_url}/#{metric.id}", params: new_attributes, headers: valid_headers, as: :json }
      it { expect(response).to have_http_status(:ok) }
      it { expect(metric.reload.value).to eql(32) }
    end

    context 'with invalid parameters' do
      before { patch "#{metrics_url}/#{metric.id}", params: invalid_attributes, headers: valid_headers, as: :json }
      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(response.body).to include("can't be blank") }
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested metric' do
      expect do
        delete "#{metrics_url}/#{metric.id}", headers: valid_headers, as: :json
      end.to change(Metric, :count).by(-1)
    end
  end
end
