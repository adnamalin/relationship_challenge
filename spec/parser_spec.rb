require_relative '../parser'
require_relative '../investor'
require_relative '../account'
require_relative '../document'

RSpec.describe Parser do

  let(:parser) { Parser.new }

  describe 'create investors' do
    it 'creates investors from array' do
      investors = [":Investors:", "First Name, Last Name, ID", "Amanda, Lin, 1234"]
      expect(parser.create_investors(investors)[0]).to be_a Investor
    end
  end

  describe 'create accounts' do
    it 'creates accounts from array' do
      accounts = [":Accounts:", "Account Name, ID", "Global Opportunity, 2525"]
      expect(parser.create_accounts(accounts)[0]).to be_a Account
    end
  end

  describe 'create documents' do
    it 'creates documents from array' do
      documents = [":Accounts:", "Account Name, ID", "Global Opportunity, 2525"]
      expect(parser.create_documents(documents)[0]).to be_a Document
    end
  end

end
