require_relative '../parser'
require_relative '../investor'
require_relative '../account'
require_relative '../document'

RSpec.describe Parser do

  let(:parser) { Parser.new }
  let(:investor) { Investor.new(first_name: "Amanda", last_name: "Lin", id: "1234") }
  let(:document) { Document.new(name: "Backstop Solutions" ,size: "4815162342", id: "4321") }
  let(:account) { Account.new(name: "Backstop Solutions" ,id: "5678") }

  describe 'parse file' do
    it 'takes a file and parses it into a has with keys investors, documents, and accounts' do
      parsed = parser.parse_file('input_text.txt')
      expect(parsed[:investors].first.id).to eq "8675309"
      expect(parsed[:documents].first.id).to eq "1984"
      expect(parsed[:accounts].first.id).to eq "2525"
    end
  end

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
      documents = [":Documents:", "File Name, Size, ID", "meeting_notes_jan.pdf, 4815162342, 1984"]
      expect(parser.create_documents(documents)[0]).to be_a Document
    end
  end

  describe 'assigning relationships' do

      describe '#assign_investor_documents' do
        it 'takes array of Investors to Documents Relations and inserts the document ID into the corresponding Investor.documents array' do
          relations =  [":Investors to Documents Relations:", "Investor ID, Document ID", "1234, 4321"]
          investors = [investor]
          docs = [document]
          parser.assign_investor_documents(relations, investors)
          expect(investor.documents[0]).to eq "4321"
        end
      end

      describe '#assign_documents_investors' do
        it 'takes array of Investors to Documents Relations and inserts the investor ID into the corresponding document.investors array' do
          relations =  [":Investors to Documents Relations:", "Investor ID, Document ID", "1234, 4321"]
          investors = [investor]
          docs = [document]
          parser.assign_documents_investors(relations, docs)
          expect(document.investors[0]).to eq "1234"
        end
      end

      describe '#assign_investor_accounts' do
        it 'takes array of Investors to Accounts Relations and inserts the account ID into the corresponding investors.accounts array' do
          relations =  [":Investors to Accounts Relations:", "Investor ID, Account ID", "1234, 4321"]
          investors = [investor]
          accounts = [account]
          parser.assign_investor_accounts(relations, investors)
          expect(investor.accounts[0]).to eq "4321"
        end
      end

      describe '#assign_documents_accounts' do
        it 'Documents to Accounts Relations and inserts the account ID into the corresponding document.accounts array' do
          relations =  [":Documents to Accounts Relations:", "Document ID, Account ID", "4321, 5678"]
          docs = [document]
          accounts = [account]
          parser.assign_documents_accounts(relations, docs)
          expect(document.accounts[0]).to eq "5678"
        end
      end

  end

  end
