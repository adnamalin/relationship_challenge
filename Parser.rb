require_relative 'investor.rb'

class Parser

  def parse_file(file)
    parsed_file = File.new(file).readlines
    cleaned_file = clean_new_lines(parsed_file)
    create_information_array(cleaned_file)
  end

  def create_investors(investors_arr)
    investors = []
    investors_arr[2..-1].each do |raw_investor|
      seperate_attr = raw_investor.split(", ")
      investors << Investor.new(first_name: seperate_attr[0], last_name: seperate_attr[1], id: seperate_attr[2])
    end
    investors
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

# parser = Parser.new
# p parser.parse_file('input_text.txt')
