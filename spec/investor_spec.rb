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
      expect(investor.id).to eq 1234
    end

    it 'has an array of document ids it has direct connection to' do
      expect(investor.documents).to eq []
    end

  end

  # describe 'working with the cast' do
  #   describe '#remaining_budget' do
  #     it 'calculates the amount of casting budget left after paying the currect cast' do
  #       actor_1 = Actor.new(salary: 1_000_000)
  #       actor_2 = Actor.new(salary: 1_250_000)
  #
  #       film_project = FilmProject.new(cast: [actor_1, actor_2], casting_budget: 2_500_000)
  #
  #       expect(film_project.remaining_budget).to be 250_000
  #     end
  #   end
end
