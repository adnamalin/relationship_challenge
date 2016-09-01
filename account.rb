class Account

  attr_reader :name, :id

  def initialize(account_details)
    @name = account_details[:name]
    @id = account_details[:id]
  end

end
