require_relative '../parser'
require_relative '../investor'

RSpec.describe Investor do

  let(:parser) { Parser.new }

  describe 'create investors' do

    it 'creates investors from array' do
      investors = [":Investors:", "First Name, Last Name, ID", "Amanda, Lin, 1234"]
      expect(parser.create_investors(investors)[0]).to be_a Investor
    end

  end

end
