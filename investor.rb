class Investor

  attr_reader :first_name, :last_name, :id, :documents

  def initialize(investor_details)
    @first_name = investor_details[:first_name]
    @last_name = investor_details[:last_name]
    @id = investor_details[:id]
    @documents = []
  end

end
