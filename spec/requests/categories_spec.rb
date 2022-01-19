require 'rails_helper'
RSpec.describe '/categories', type: :request do
  let!(:site) { create(:site, name: 'Gims', auto: 'inactive') }
  let!(:valid_attributes) { { name: 'Duncan', site_id: site.id } }
  let!(:invalid_attributes) { { name: '', site_id: site.id } }
  let!(:valid_headers) { {} }
  let!(:category) { create(:category, name: 'Healed', site: site) }
  let!(:category_two) { create(:category, name: 'Affected', site: site) }
  let!(:sites_url) { "/api/v1/sites/#{site.id}/categories" }
  let!(:categories_url) { '/api/v1/categories' }

  describe 'GET /index' do
    before { get sites_url, headers: valid_headers, as: :json }
    it { expect(response).to be_successful }
    it { expect(response.body).to include('Affected') }
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      before { post categories_url, params: valid_attributes, headers: valid_headers, as: :json }
      it { expect(response).to have_http_status(:created) }
      it { expect(response.body).to include('Duncan') }
    end

    context 'with invalid parameters' do
      before { post categories_url, params: invalid_attributes, as: :json }
      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(response.body).to include("can't be blank") }
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { { name: 'Ikebe', site_id: site.id } }
      before { patch "#{categories_url}/#{category.id}", params: new_attributes, headers: valid_headers, as: :json }
      it { expect(response).to have_http_status(:ok) }
      it { expect(category.reload.name).to eql('Ikebe') }
    end

    context 'with invalid parameters' do
      before do
        patch "#{categories_url}/#{category.id}", params: invalid_attributes, headers: valid_headers, as: :json
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(response.body).to include("can't be blank") }
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested category' do
      expect do
        delete "#{categories_url}/#{category.id}", headers: valid_headers, as: :json
      end.to change(Category, :count).by(-1)
    end
  end
end
