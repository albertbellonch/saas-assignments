def palindrome?(string)
  string.downcase!
  string.gsub!(/\W+/, '')
  string == string.reverse
end

def count_words(string)
  count = Hash.new{ |h, k| h[k] = 0 }
  string.split(/\b/).select{|w| w =~ /\w+/ }.map(&:downcase).each do |word|
    count[word] += 1
  end
  count
end
