require_relative '../investor'

RSpec.describe Investor do

  let(:investor) { Investor.new(first_name: "Amanda", last_name: "Lin", id: "1234") }

  describe 'attributes' do
    it 'has a first name' do
      expect(investor.first_name).to eq 'Amanda'
    end

    it 'has a last name' do
      expect(investor.last_name).to eq 'Lin'
    end

    it 'has an id' do
      expect(investor.id).to eq "1234"
    end

    it 'has an array of document ids it has direct connection to' do
      expect(investor.documents).to eq []
    end

    it 'has an array of account ids it has direct connection to' do
      expect(investor.accounts).to eq []
    end

  end

  describe 'checking authorization' do

      describe '#direct_access?' do
        it 'returns true if investor has direct access to document' do
          investor.documents << "4321"
          investor.documents << "5678"
          expect(investor.direct_access_to_doc?("4321")).to eq true
        end

        it 'returns false if investor does not direct access to document' do
          investor.documents << "4321"
          investor.documents << "5678"
          expect(investor.direct_access_to_doc?("9999")).to eq false
        end
      end

      describe '#accounts' do
        it 'has an array of document ids it has direct connection to' do
          investor.accounts << "1234"
          investor.accounts << "5678"
          expect(investor.accounts).to eq ["1234", "5678"]
        end
      end

  end

end
