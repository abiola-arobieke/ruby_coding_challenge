def is_palindrome?(x)
  num_arr = x.to_s.chars
  num_arr == num_arr.reverse
end

p is_palindrome?(121)
p is_palindrome?(1000021)