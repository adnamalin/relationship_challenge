class ResultPrinter

  def print_results_investors_to_docs(status, investor, document)
    if status
      puts "#{investor.first_name} has access to #{document.name}"
    else
      puts "#{investor.first_name} does not have access to #{document.name}"
    end
  end

  def print_stored_info(investors, documents)
    puts "Investors:"
    investors.each {|i| puts "#{i.id}: #{i.first_name} #{i.last_name}"}
    puts "\nDocuments:"
    documents.each {|d| puts "#{d.id}: #{d.name}"}
  end

end
