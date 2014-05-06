#testing wordcloud for csci311 project
#Written By James Glennan 2014

require_relative 'parser'
require_relative 'wordcloud'

`ruby parser.rb 15>>output.txt`


 if $? == 0
   puts "Execution Successful\n"
   puts "Now Testing Compenents"

  
   file=File.open("test", 'w')

   file.write("This this tHIs IS is Is the fiLE that will be utilised utilised UTILised for TESTING testing tEsting testing testing testing TESTING testing tEsting testing testing testing")



 else
   puts "Execution Not Successful"
 end
