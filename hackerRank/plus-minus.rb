#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'plusMinus' function below.
#
# The function accepts INTEGER_ARRAY arr as parameter.
#

def plusMinus(arr)
  arr_size = arr.size
  zero_count = 0
  negative_count = 0
  positive_count = 0
  arr.each do |e|
    if e > 0
      positive_count += 1
    elsif e < 0
      negative_count += 1
    else
      zero_count += 1
    end
  end


  puts format('%.6f', positive_count.to_f / arr_size)
  puts format('%.6f', negative_count.to_f / arr_size)
  puts format('%.6f', zero_count.to_f / arr_size)
end

n = gets.strip.to_i

arr = gets.rstrip.split.map(&:to_i)

plusMinus arr
