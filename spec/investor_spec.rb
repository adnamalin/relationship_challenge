require_relative '../investor'

RSpec.describe Investor do

  let(:director) { Investor.new(first_name: "Amanda") }

  describe 'attributes' do
    it 'has a title' do
      expect(film_project.title).to eq 'Movie 1'
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
end
