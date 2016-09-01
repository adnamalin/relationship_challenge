require_relative 'parser'

#####SET UP######

## parse file into objects
parser = Parser.new
file = 'input_text.txt'
created_object = parser.parse_file(file)
investors = created_object[:investors]
documents = created_object[:documents]

##find Bob, actual_notes, and super_secret_meeting_notes_jan
bob = investors.select {|i| i.id == "8675309"}[0]
actual_notes = documents.select {|i| i.id == "1215"}[0]
super_secret_meeting_notes_jan = created_object[:documents].select {|i| i.id == "1929"}[0]

##Check access
bob_results = bob.has_access_to_doc?(actual_notes)
super_secret_results = super_secret_meeting_notes_jan.all_investors_with_access(investors)

#Print Results 
puts "Can Bob Jones see the actual_notes.txt? #{bob_results}"
puts "What are the ids of the Investors can see the super_secret_meeting_notes_jan.pdf? #{super_secret_results.join(", ")}"
