require_relative '../document'

RSpec.describe Document do

  let(:document) { Document.new(name: "Backstop Solutions" ,size: "4815162342", id: "1234") }
  let(:investor) { Investor.new(first_name: "Amanda", last_name: "Lin", id: "1234") }

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

    it 'has an array of account ids it has direct connection to' do
      expect(document.accounts).to eq []
    end

    it 'has an array of investor ids it has direct connection to' do
      expect(document.investors).to eq []
    end

  end

  describe 'checking authorization' do

      describe '#investors' do
        it 'has an array of investor ids it has direct connection to' do
          document.investors << "1234"
          document.investors << "5678"
          expect(document.investors).to eq ["1234", "5678"]
        end
      end

      describe '#accounts' do
        it 'has an array of account ids it has direct connection to' do
          document.accounts << "1234"
          document.accounts << "5678"
          expect(document.accounts).to eq ["1234", "5678"]
        end
      end

      describe '#all_investors_with_access' do
        it 'returns array of ids of investors with access' do
          document.accounts << "5678"
          investor.accounts << "5678"
          investors = [investor]
          expect(document.all_investors_with_access(investors)).to eq ["1234"]
        end

        it 'returns empty array of given investors dont have access' do
          document.accounts << "5678"
          investor.accounts << "4321"
          investors = [investor]
          expect(document.all_investors_with_access(investors)).to eq []
        end
      end
  end

end
