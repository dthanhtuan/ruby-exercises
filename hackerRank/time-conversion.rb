#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'timeConversion' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

def timeConversion(s)
  # Split the input string into components
  time_parts = s.split(':')
  hours = time_parts[0].to_i
  minutes = time_parts[1]
  seconds = time_parts[2][0..1]
  period = time_parts[2][2..3]

  # Convert to 24-hour format
  if period == 'PM' && hours != 12
    hours += 12
  elsif period == 'AM' && hours == 12
    hours = 0
  end

  # Format the result as a string with leading zeros if necessary
  "#{format('%02d', hours)}:#{minutes}:#{seconds}"

end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.chomp

result = timeConversion s

fptr.write result
fptr.write "\n"

fptr.close()
