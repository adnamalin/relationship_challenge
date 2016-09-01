class Document

  attr_reader :name, :id, :size, :investors, :accounts

  def initialize(account_details)
    @name = account_details[:name]
    @size = account_details[:size]
    @id = account_details[:id]
    @investors = []
    @accounts = []
  end

  def all_investors_with_access(investors)
    indirect_investors = investors.select {|i| i.accounts & accounts != []}
    all_investors = indirect_investors.map {|i| i.id} + @investors
    all_investors.uniq
  end

end
