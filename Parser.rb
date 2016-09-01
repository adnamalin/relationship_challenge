class Parser

  def parse_file(file)
    parsed_file = File.new(file).readlines
    cleaned_file = clean_new_lines(parsed_file)
    create_information_array(cleaned_file)
  end

  private

  def create_investors
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
p parser.parse_file('input_text.txt')
