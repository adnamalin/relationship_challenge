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

  end

  # describe 'checking authorization' do
  #
  #     describe '#direct_access?' do
  #       it 'returns true or false if investor has direct access to document' do
  #       end
  #
  #     end
  # end

end
