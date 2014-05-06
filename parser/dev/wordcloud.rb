
require 'csv'
require 'json'

def fileParse(words, word_counts)
common_words = File.open('common_words.txt','r').read.encode!('UTF-8','UTF-8', :invalid => :replace).split("\n")

#convert all of the words to lowercase
words.map!{|c| c.downcase.strip}

#remove special characters from the words
words.map!{|c| c.gsub(/[^a-z\-]|^\w{0,3}$/,'')}

# put the words into a dictionary with counts

words.each do |word|
    word_counts[word] += 1
end

# remove common words from the word list. Also removes
# Any blank words that appeared after removing
# special characters
common_words.each do |word|
    word_counts.delete(word)
    word_counts.delete('')
end

return word_counts

end

def open_file(filename, word_counts)
  s = File.open(filename,'r').read
  s = s.encode("UTF-8", invalid: :replace, undef: :replace)
  words=s.split
  word_counts=fileParse(words, word_counts)
return word_counts
end

def printout(word_counts, numofwords)
file=File.open("wordweight.json", 'w')
word_counts = word_counts.sort_by {|word,count| count}.reverse
i=0

ar=Hash.new

# produce the output
word_counts.each do |word, count|


  puts "#{word}:#{count}"

ar["#{word}"]=count

    i+=1

    if i >= numofwords then
      break
    end
end

puts ar

file.write("[")
file.write(JSON.generate(ar,))
file.write("]")

end
