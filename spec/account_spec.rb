require_relative '../account'

RSpec.describe Account do

  let(:account) { Account.new(name: "Backstop Solutions" ,id: "1234") }

  describe 'attributes' do
    it 'has a name' do
      expect(account.name).to eq 'Backstop Solutions'
    end

    it 'has an id' do
      expect(account.id).to eq "1234"
    end
  end
end
