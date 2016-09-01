class Document

  attr_reader :name, :id, :size, :investors, :accounts

  def initialize(account_details)
    @name = account_details[:name]
    @size = account_details[:size]
    @id = account_details[:id]
    @investors = []
    @accounts = []
  end

end
