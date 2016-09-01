class Investor

  attr_reader :first_name, :last_name, :id, :documents, :accounts

  def initialize(investor_details)
    @first_name = investor_details[:first_name]
    @last_name = investor_details[:last_name]
    @id = investor_details[:id]
    @documents = []
    @accounts = []
  end

  def has_access_to_doc?(document_object)
    direct_access_to_doc?(document_object) || indirect_access_to_doc?(document_object)
  end

  def direct_access_to_doc?(document_object)
    documents.include?(document_object.id)
  end

  def indirect_access_to_doc?(document_object)
    accounts & document_object.accounts != []
  end

end
