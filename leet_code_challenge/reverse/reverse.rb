
def reverse(x)
  num_str = x.to_s
  min_32_bit_signed = -2**31
  max_32_bit_signed = 2**31 - 1
  rev_num = num_str.reverse.to_i

  unless x >= min_32_bit_signed && x <= max_32_bit_signed 
      return 0
  end

  unless rev_num >= min_32_bit_signed && rev_num <= max_32_bit_signed
      return 0
  end

  return 0 - rev_num if num_str[0] == "-"
  return rev_num

end


p reverse(9646324351)
p reverse(1534236469)
p reverse(235)
p reverse(-264)
