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
    assign_investor_documents(raw_info[4], investors)
    investors
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
      documents << Document.new(name: seperate_attr[0],id: seperate_attr[1])
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

  def clean_new_lines(parsed_file)
    parsed_file.map! {|l| l.chomp }
  end

  def create_information_array(parsed_file_arr)
    final_arr = []
    array = []
    parsed_file_arr.each do |line|
      if line.match(/[:].+[:]/)
        array = []
        array << line
      elsif line == ""
        final_arr << array
      else
        array << line
      end
    end
    final_arr
  end

end

parser = Parser.new
parsed_to_objects = parser.parse_file('input_text.txt')
p parsed_to_objects
# investors = parsed_to_objects[0]
# accounts = parsed_to_objects[1]
# documents = parsed_to_objects[2]
