# Given a string s, find the length of the longest substring without repeating characters.
# Initialize two pointers: left and right, both starting at the beginning of the string.
# Expand the window by moving right forward, adding new characters to the window.
# Check the constraint: If the character at right is already in the current window (i.e., a duplicate is found),
##   the window violates the constraint of uniqueness.
# To fix this, shrink the window from the left by moving left forward, removing characters
##   until the duplicate is eliminated and the window contains only unique characters again.
# Update the result (e.g., maximum length) whenever the window satisfies the constraint.
# Repeat until right reaches the end of the string.
def length_of_longest_substring(input_string)
  substring_and_length = {}
  char_set = Set.new
  max_length = 0
  left = 0
  right = 0
  input_string.chars.each do |_char|
    puts "Current character: #{_char}, Left: #{left}, Right: #{right}, Char Set: #{char_set.to_a}"
    while char_set.include?(input_string[right])
      char_set.delete(input_string[left])
      left += 1
    end
    char_set.add(input_string[right])
    substring_and_length[char_set.join] = char_set.length
    max_length = [max_length, char_set.length].max
    right += 1
  end
  puts substring_and_length
  max_length
end

s = "qrsvbspk"
puts length_of_longest_substring(s)
