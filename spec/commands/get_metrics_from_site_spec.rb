require 'rails_helper'

describe GetMetricsFromSite do
  let!(:site) { create(:site, name: 'Gims', auto: 'inactive') }
  let!(:site_two) { create(:site, name: 'Tacy', auto: 'inactive') }
  let!(:category) { create(:category, name: 'Healed', site: site) }
  let!(:metric) { create(:metric, value: 20, category: category, created_at: 1.hour.ago) }
  let!(:metric_two) { create(:metric, value: 10, category: category, created_at: 1.minute.ago) }
  let!(:metric_three) { create(:metric, value: 5, category: category, created_at: 24.hour.ago) }
  let!(:metric_four) { create(:metric, value: 20, category: category, created_at: 1.minute.ago) }

  describe '#perform' do
    context 'When site is provided' do
      it{ expect(described_class.for(site: site).first.value).to eql(20)}
    end
    context 'When site is not provided' do
      it{ expect{ described_class.for(site: '')}.to raise_error(RuntimeError) }
    end
    context 'When site entity is not provided' do
      it{ expect{ described_class.for(site: category)}.to raise_error(RuntimeError) }
    end
  end
end