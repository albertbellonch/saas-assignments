def combine_anagrams(words)
  combinations = Hash.new { |k,v| k[v] = [] }
  words.each do |word|
    id = word.split(//).sort.join.downcase
    combinations[id] += [word]
  end
  combinations.values.map{ |a| a.sort }
end
