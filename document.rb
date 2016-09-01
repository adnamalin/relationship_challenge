class Document

  attr_reader :name, :id, :size, :investors

  def initialize(account_details)
    @name = account_details[:name]
    @size = account_details[:size]
    @id = account_details[:id]
    @investors = []
  end

end
