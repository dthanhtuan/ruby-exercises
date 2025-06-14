# Fibonacci
def fibonacci(n)
  return n if n <= 1

  fibonacci(n - 1) + fibonacci(n - 2)
end

def fibonacci_hash(n, memo = {})
  return n if n <= 1
  return memo[n] if memo.key?(n)

  memo[n] = fibonacci_hash(n - 1, memo) + fibonacci_hash(n - 2, memo)
end
