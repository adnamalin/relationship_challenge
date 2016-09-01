require_relative 'investor.rb'
require_relative 'account.rb'
require_relative 'document.rb'

class Parser

  def parse_file(file)
    parsed_file = File.new(file).readlines
    cleaned_file = clean_new_lines(parsed_file)
    raw_info = create_information_array(cleaned_file)
    investors = create_investors(raw_info[0])
    accounts = create_accounts(raw_info[1])
    documents = create_documents(raw_info[2])
    assign_all_relationships(raw_info, investors, accounts, documents)
    created_objects = {investors: investors, accounts: accounts, documents: documents}
  end

  def assign_all_relationships(raw_data, investors, accounts, documents)
    assign_investor_documents(raw_data[4], investors, documents)
    assign_documents_investors(raw_data[4], investors, documents)
    assign_investor_accounts(raw_data[5], investors, accounts)
    assign_documents_accounts(raw_data[3], documents, accounts)
  end

  def create_investors(investors_arr)
    investors = []
    investors_arr[2..-1].each do |raw_investor|
      seperate_attr = raw_investor.split(", ")
      investors << Investor.new(first_name: seperate_attr[0], last_name: seperate_attr[1], id: seperate_attr[2])
    end
    investors
  end

  def create_accounts(accounts_arr)
    accounts = []
    accounts_arr[2..-1].each do |raw_acct|
      seperate_attr = raw_acct.split(", ")
      accounts << Account.new(name: seperate_attr[0],id: seperate_attr[1])
    end
    accounts
  end

  def create_documents(doc_arr)
    documents = []
    doc_arr[2..-1].each do |raw_doc|
      seperate_attr = raw_doc.split(", ")
      documents << Document.new(name: seperate_attr[0],size:seperate_attr[1] ,id: seperate_attr[2])
    end
    documents
  end

  def assign_investor_documents(relations, investors)
    relations[2..-1].each do |relation|
      collect_ids = relation.split(", ")
      find_investor = investors.select {|i| i.id == collect_ids[0]}
      if find_investor != []
        find_investor[0].documents << collect_ids[1]
      end
    end
  end

  def assign_documents_investors(relations, documents)
    relations[2..-1].each do |relation|
      collect_ids = relation.split(", ")
      find_docs = documents.select {|i| i.id == collect_ids[1]}
      if find_docs != []
        find_docs[0].investors << collect_ids[0]
      end
    end
  end

  def assign_investor_accounts(relations, investors)
    relations[2..-1].each do |relation|
      collect_ids = relation.split(", ")
      find_invs = investors.select {|i| i.id == collect_ids[0]}
      if find_invs != []
        find_invs[0].accounts << collect_ids[1]
      end
    end
  end

  def assign_documents_accounts(relations, documents)
    relations[2..-1].each do |relation|
      collect_ids = relation.split(", ")
      find_docs = documents.select {|d| d.id == collect_ids[0]}
      if find_docs != []
        find_docs[0].accounts << collect_ids[1]
      end
    end
  end

  def clean_new_lines(parsed_file)
    parsed_file.map! {|l| l.chomp }
  end

  def create_information_array(parsed_file_arr)
    final_arr = []
    array = []
    parsed_file_arr.each do |line|
      if line.match(/[:].+[:]/) != nil
        array = []
        array << line
      elsif line == ""
        final_arr << array
      elsif line == parsed_file_arr[-1]
        #corrects for the last line in file
        final_arr << array
      else
        array << line
      end
    end
    final_arr
  end

end
