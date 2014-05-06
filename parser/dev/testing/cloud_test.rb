#testing wordcloud for csci311 project
#Written By James Glennan 2014

require_relative '../parser.rb'
require_relative '../wordcloud.rb'

`ruby ../parser.rb 15>>output.txt`


 if $? == 0
   puts "Execution Successful\n"
   puts "Now Testing Components\n\n"


   file=File.open("test", 'w')

   file.write("This this tHIs IS is Is the fiLE file file file file file that will be utilised utilised UTILised for testing testing TESTING testing tEsting testing testing testing TESTING testing tEsting testing testing testing")

  file.close()

testfile = Hash.new(0)

testfile = open_file(file, testfile)

if testfile["testing"] != 14 || testfile["file"] != 6 || testfile["utilised"] != 3 then
  puts "TEST FAILED"
else
  puts "PASSED"
end


File.delete("test")

 else
   puts "TEST FAILED"
 end
