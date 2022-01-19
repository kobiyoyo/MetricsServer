require 'rails_helper'

RSpec.describe '/sites', type: :request do
  let!(:valid_attributes) { { name: 'Desmond', auto: 'inactive' } }
  let!(:invalid_attributes) { { name: '', auto: '' } }
  let!(:valid_headers) { {} }
  let!(:site) { create(:site, name: 'Gims', auto: 'inactive') }
  let!(:site_two) { create(:site, name: 'Dorime', auto: 'active') }
  let!(:sites_url) { '/api/v1/sites' }
  describe 'GET /index' do
    before { get sites_url, headers: valid_headers, as: :json }
    it { expect(response).to be_successful }
    it { expect(response.body).to include('Dorime') }
  end

  describe 'GET /show' do
    before { get "#{sites_url}/#{site.id}", headers: valid_headers, as: :json }
    it { expect(response).to be_successful }
    it { expect(response.body).to include('Gims') }
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      before { post sites_url, params: valid_attributes, headers: valid_headers, as: :json }
      it { expect(response).to have_http_status(:created) }
      it { expect(response.body).to include('Desmond') }
    end

    context 'with invalid parameters' do
      before { post sites_url, params: invalid_attributes, as: :json }
      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(response.body).to include("can't be blank") }
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'Daniel', auto: 'active' }
      end
      before { patch "#{sites_url}/#{site.id}", params: new_attributes, headers: valid_headers, as: :json }
      it { expect(response).to have_http_status(:ok) }
      it { expect(site.reload.name).to eql('Daniel') }
    end

    context 'with invalid parameters' do
      before { patch "#{sites_url}/#{site.id}", params: invalid_attributes, headers: valid_headers, as: :json }
      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(response.body).to include("can't be blank") }
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested site' do
      expect do
        delete "#{sites_url}/#{site.id}", headers: valid_headers, as: :json
      end.to change(Site, :count).by(-1)
    end
  end
end
