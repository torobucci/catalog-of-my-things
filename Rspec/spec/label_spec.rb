require_relative '../../item'
require_relative '../../classes/label'

RSpec.describe Label do
  let(:title) { "Label Title" }
  let(:color) { "Label Color" }
  subject(:label) { described_class.new(title, color) }

  describe "#initialize" do
    it "sets the title, color, id, and items" do
      expect(label.title).to eq(title)
      expect(label.color).to eq(color)
      expect(label.id).to be_between(1, 1000).inclusive
      expect(label.items).to be_a(Array)
    end
  end

  describe "#add_item" do
    let(:item) { Item.new("2022-01-01") }

    it "adds the item to the items array" do
      expect {
        label.add_item(item)
      }.to change { label.items.length }.by(1)
    end

    it "sets the label of the added item to self" do
      label.add_item(item)
      expect(item.label).to eq(label)
    end
  end
end
