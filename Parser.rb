require_relative 'investor.rb'
require_relative 'account.rb'
require_relative 'document.rb'

class Parser

  def parse_file(file)
    raw_info = create_information_array(file)
    investors = create_investors(raw_info[0])
    accounts = create_accounts(raw_info[1])
    documents = create_documents(raw_info[2])
    assign_all_relationships(raw_info, investors, documents)
    created_objects = {investors: investors, accounts: accounts, documents: documents}
  end

  def assign_all_relationships(raw_data, investors, documents)
    assign_investor_documents(raw_data[4], investors)
    assign_documents_investors(raw_data[4], documents)
    assign_investor_accounts(raw_data[5], investors)
    assign_documents_accounts(raw_data[3], documents)
  end

  def create_investors(investors_arr)
    investors_arr[2..-1].map do |raw_investor|
      seperate_attr = raw_investor.split(", ")
      Investor.new(first_name: seperate_attr[0], last_name: seperate_attr[1], id: seperate_attr[2])
    end
  end

  def create_accounts(accounts_arr)
    accounts_arr[2..-1].map do |raw_acct|
      seperate_attr = raw_acct.split(", ")
      Account.new(name: seperate_attr[0],id: seperate_attr[1])
    end
  end

  def create_documents(doc_arr)
    doc_arr[2..-1].map do |raw_doc|
      seperate_attr = raw_doc.split(", ")
      Document.new(name: seperate_attr[0],size:seperate_attr[1] ,id: seperate_attr[2])
    end
  end

  def assign_investor_documents(relations, investors)
    relations[2..-1].each do |relation|
      collect_ids = relation.split(", ")
      find_investor = investors.select {|i| i.id == collect_ids[0]}
      find_investor[0].documents << collect_ids[1] if find_investor != []
    end
  end

  def assign_documents_investors(relations, documents)
    relations[2..-1].each do |relation|
      collect_ids = relation.split(", ")
      find_docs = documents.select {|i| i.id == collect_ids[1]}
      find_docs[0].investors << collect_ids[0] if find_docs != []
    end
  end

  def assign_investor_accounts(relations, investors)
    relations[2..-1].each do |relation|
      collect_ids = relation.split(", ")
      find_invs = investors.select {|i| i.id == collect_ids[0]}
      find_invs[0].accounts << collect_ids[1] if find_invs != []
    end
  end

  def assign_documents_accounts(relations, documents)
    relations[2..-1].each do |relation|
      collect_ids = relation.split(", ")
      find_docs = documents.select {|d| d.id == collect_ids[0]}
      find_docs[0].accounts << collect_ids[1] if find_docs != []
    end
  end

  def create_information_array(file)
    filelines = File.new(file).readlines
    final_arr = []
    current_array = []
    filelines.each do |line|
      line.chomp!
      if line.match(/[:].+[:]/) != nil
        current_array = []
        current_array << line
      elsif line == "" || line == filelines.last
        final_arr << current_array
      else
        current_array << line
      end
    end
    final_arr
  end

end
