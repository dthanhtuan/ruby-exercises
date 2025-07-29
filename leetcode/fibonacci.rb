# Fibonacci
def fibonacci(n)
  return n if n <= 1

  fibonacci(n - 1) + fibonacci(n - 2)
end

# For Fibonacci, usually fib(0) = 0 and fib(1) = 1.
def fibonacci_hash(n, memo = {})
  return n if n <= 1
  return memo[n] if memo.key?(n)

  memo[n] = fibonacci_hash(n - 1, memo) + fibonacci_hash(n - 2, memo)
end

# For Climbing Stairs, you want:
# ways(1) = 1 (one way to climb one stair)
# ways(2) = 2 (two ways: 1+1 or 2)
def climb_stairs(n, memo = {})
  return 1 if n == 1
  return 2 if n == 2
  return memo[n] if memo.key?(n)

  memo[n] = climb_stairs(n - 1, memo) + climb_stairs(n - 2, memo)
end
