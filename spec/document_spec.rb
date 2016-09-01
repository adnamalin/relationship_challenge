require_relative '../document'

RSpec.describe Document do

  let(:document) { Document.new(name: "Backstop Solutions" ,size: "4815162342", id: "1234") }

  describe 'attributes' do
    it 'has a name' do
      expect(document.name).to eq 'Backstop Solutions'
    end

    it 'has a size' do
      expect(document.size).to eq "4815162342"
    end

    it 'has an id' do
      expect(document.id).to eq "1234"
    end

    it 'has an array of investor ids it has direct connection to' do
      expect(document.investors).to eq []
    end
  end
end
