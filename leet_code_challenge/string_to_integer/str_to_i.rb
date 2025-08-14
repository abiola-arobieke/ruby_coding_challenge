def my_atoi(s)
  str = s.lstrip
  min_32_bit_signed = -2**31
  max_32_bit_signed = 2**31 - 1
  str_i = str.to_i


  return min_32_bit_signed if str_i < min_32_bit_signed
  return max_32_bit_signed if str_i > max_32_bit_signed
  return str.to_i
end

p my_atoi(" -0001337c0d3")
p my_atoi("0-1")
p my_atoi('sggss')
p my_atoi("words and 987")
p my_atoi("-9646324351")