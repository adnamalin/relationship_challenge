require_relative 'parser'
require_relative 'result_printer'

class DocumentApplication

  def initialize
    @parser = Parser.new
    @result_printer = ResultPrinter.new
  end

  def run_program
    objects_collection = get_file
    @result_printer.print_stored_info(objects_collection[:investors], objects_collection[:documents])
    puts "\n- To find if an investor has access to a file write:\n <investor id> <document id>\n- To find all investors a document is avaiable to write:\n <document id>\n- Enter 'quit' to end the program"
    user_input = []
    until user_input[0] == "quit"
      user_input = gets.chomp.split(" ")
      if user_input.length == 2
        investor_to_document_relation(objects_collection,user_input)
      elsif user_input.length == 1
        if user_input[0] != "quit"
          documents_investors(objects_collection, user_input[0])
        end
      end
    end
  end

  def get_file
    puts "Enter the full file name of your input"
    file = gets.chomp
    @parser.parse_file(file)
  end

  def find_investor(investor_id, investors)
    investors.select {|i| i.id == investor_id}[0]
  end

  def find_document(document_id, documents)
    documents.select {|d| d.id == document_id}[0]
  end

  def documents_investors(collection, document_id)
    document = find_document(document_id, collection[:documents])
    investor_ids = document.all_investors_with_access(collection[:investors])
    @result_printer.print_investors_for_document(investor_ids)
  end

  def investor_to_document_relation(collection,user_input)
    investor = find_investor(user_input[0], collection[:investors])
    document = find_document(user_input[1], collection[:documents])
    status = investor.has_access_to_doc?(document)
    @result_printer.print_results_investors_to_docs(status, investor, document)
  end

end
