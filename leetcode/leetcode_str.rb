# frozen_string_literal: true

puts 'Enter the string:'
sample_string = '(ed(et(oc))el)'
puts "input: #{sample_string}"
stack = []
close_bracket = ')'
open_bracket = '('
sample_string.each_char do |char|
  stack.push(char)
  puts "stack:, #{stack}"
  next unless char == close_bracket

  stack.pop # pop the close bracket

  nested_bracket_elements = []
  popped_element_from_stack = stack.pop
  while popped_element_from_stack != open_bracket
    nested_bracket_elements.push(popped_element_from_stack)
    popped_element_from_stack = stack.pop
  end

  stack += nested_bracket_elements
  puts "nested_bracket_elements:, #{nested_bracket_elements}"
end
puts "stack:, #{stack}"
puts "output:, #{stack.join}"
