require_relative '../../item'
require_relative '../../classes/label'

RSpec.describe Label do
  let(:title) { 'Label Title' }
  let(:color) { 'Red' }
  let(:label) { Label.new(title, color) }

  describe '#initialize' do
    it 'sets the title' do
      expect(label.title).to eq(title)
    end
  end

  describe '#add_item' do
    let(:item) { Item.new('2020-01-01', false) }

    it 'adds the item to the label' do
      expect { label.add_item(item) }.to change { label.instance_variable_get(:@items).length }.by(1)
    end

    it 'sets the label attribute of the item' do
      label.add_item(item)
      expect(item.label).to eq(label)
    end
  end
end
