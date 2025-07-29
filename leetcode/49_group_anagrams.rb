# Input: strs = ["eat","tea","tan","ate","nat","bat"]
# Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

def group_anagrams(strs)
  anagrams = Hash.new { |hash, key| hash[key] = [] }

  strs.each do |str|
    sorted_str = str.chars.sort.join
    anagrams[sorted_str] << str
  end

  anagrams.values
end
