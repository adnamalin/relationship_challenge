class Investor

  attr_reader :first_name, :last_name, :id, :documents, :accounts

  def initialize(investor_details)
    @first_name = investor_details[:first_name]
    @last_name = investor_details[:last_name]
    @id = investor_details[:id]
    @documents = []
    @accounts = []
  end

  def direct_access_to_doc?(document_id)
    documents.include?(document_id)
  end

end
