require 'csv'

def fileParse(words, word_counts)
common_words = File.open('common_words.txt','r').read.encode!('UTF-8','UTF-8', :invalid => :replace).split("\n")
#substitutions = {}
#propers = {}
#CSV.foreach("substitutions.txt") do |line|
#    substitutions[line[0]] = line[1].strip
#end
#CSV.foreach("propers.txt") do |line|
#    propers[line[0]] = line[1].strip
#end


#convert all of the words to lowercase
words.map!{|c| c.downcase.strip}

#remove special characters from the words
words.map!{|c| c.gsub(/[^a-z0-9\-]/,'') }

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

# run the substitutions
#substitutions.each do |word,replace|
#    word_counts[replace] += word_counts[word]
#    word_counts.delete(word)
#end

# Change words to proper forms
#propers.each do |word,replace|
#    word_counts[replace] += word_counts[word]
#    word_counts.delete(word)
#end

# try to sort it by count


return word_counts

end
