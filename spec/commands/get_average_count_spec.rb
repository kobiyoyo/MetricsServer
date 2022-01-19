require 'rails_helper'

describe GetAverageCount do
  let!(:site) { create(:site, name: 'Gims', auto: 'inactive') }
  let!(:site_two) { create(:site, name: 'Tacy', auto: 'inactive') }
  let!(:category) { create(:category, name: 'Healed', site: site) }
  let!(:category_two) { create(:category, name: 'aled', site: site) }

  let!(:metric) { create(:metric, value: 20, category: category, created_at: 1.hour.ago) }
  let!(:metric_two) { create(:metric, value: 10, category: category, created_at: 1.minute.ago) }
  let!(:metric_three) { create(:metric, value: 5, category: category, created_at: 24.hour.ago) }
  let!(:metric_four) { create(:metric, value: 20, category: category, created_at: 1.minute.ago) }

  describe '#perform' do
    context 'When metric is provided' do
      it{ expect(described_class.for(metrics: category.metrics)).to eql({:per_day=>16.666666666666668, :per_hour=>15.0, :per_minute=>0})}
    end
    context 'When metric is not provided' do
      it{ expect{ described_class.for(metrics: '')}.to raise_error(RuntimeError) }
    end
    context 'When metric entity is not provided' do
      it{ expect{ described_class.for(metrics: site.categories)}.to raise_error(RuntimeError) }
    end
  end
end