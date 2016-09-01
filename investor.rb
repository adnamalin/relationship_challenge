class Investor

  attr_reader :first_name
  
  def initialize(investor_details)
    @first_name = investor_details[:first_name]
  end

end
