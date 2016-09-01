class ResultPrinter

  def print_results_investors_to_docs(status, investor, document)
    seperator
    if status
      puts "Results: #{investor.first_name} has access to #{document.name}"
    else
      puts "Results: #{investor.first_name} does not have access to #{document.name}"
    end
    seperator
  end

  def print_investors_for_document(investor_ids)
    seperator
    puts "Results: Investor IDs with Access: #{    investor_ids.join(", ")}"
    seperator
  end

  def print_stored_info(investors, documents)
    puts "\nInvestors:"
    investors.each {|i| puts "#{i.id}: #{i.first_name} #{i.last_name}"}
    puts "\nDocuments:"
    documents.each {|d| puts "#{d.id}: #{d.name}"}
  end

  def seperator
    puts "-" * 80
  end
end
