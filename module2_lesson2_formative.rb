#  Write a single chain of commands to find all numbers that

#   - are from an array of numbers 1..10000 inclusive
#   - are divisible by 3 (i.e., element % 3 == 0)
#   - are not less than 5000
#   - sorted in reverse order


# Grab 23 random elements between 0 and 10000
arr = (1..10000).to_a
# p arr

# This selects only elements that when divided by 3 have a remainder of 0 
# using the % (modulus) operator
# p arr.select { |element| element % 3 == 0 }

# Using `reject` method filter out anything less than 5000
# and use `sort` and `reverse` methods to sort in descending order
# Start with the line below and continue as 1 long method chain
# p arr.select { |element| element % 3 == 0 }

p arr.select{ |element| element % 3 == 0 }.reject{|element| element < 5000 }.sort.reverse