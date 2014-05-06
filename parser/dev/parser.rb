#test mail parse for csci311 project
#Written By James Glennan 2014


#require 'rubygems'
require 'zlib'
require_relative 'wordcloud'



def unzip_file (file, destination)
Zlib::GzipReader.open(file) do |gz|
  File.open(destination, "w") do |g|
    IO.copy_stream(gz, g)
  end
end
end

#START MAIN

filenames=Dir.glob("*.gz")
word_counts = Hash.new(0)

filenames.each do |fname|

  fshort=fname.chomp(".gz")
  puts fshort
  unzip_file(fname, fshort)
  s = File.open(fshort,'r').read
  s = s.encode("UTF-8", invalid: :replace, undef: :replace)
  words=s.split
  word_counts=fileParse(words, word_counts)
  File.delete(fshort)
end

printout(word_counts, 15)


#END MAIN