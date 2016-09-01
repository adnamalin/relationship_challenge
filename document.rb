class Document

  attr_reader :name, :id, :size

  def initialize(account_details)
    @name = account_details[:name]
    @size = account_details[:size].to_i
    @id = account_details[:id].to_i
  end

end