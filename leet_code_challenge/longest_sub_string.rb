
def longest_sub_string(s)
  str = s.chars
  temp = []
  sub_str_len = []
  return 0 if s.empty?

  str.each_with_index do |char|
    if temp.include?(char)
      sub_str_len << temp.length
      temp = temp[(temp.index(char) + 1)..] + [char]
    else
      temp << char
    end
  end

  sub_str_len << temp.length
  
  
  return sub_str_len.max
end

p longest_sub_string('abcda')
p longest_sub_string("pwwkew")
p longest_sub_string("abcabcbb")
p longest_sub_string("bbbbb")
p longest_sub_string("abcabeeattv")
p longest_sub_string("abcb")
p longest_sub_string("abababa")
p longest_sub_string("aaaab")
p longest_sub_string("dvdf")
p longest_sub_string("bdb")
p longest_sub_string("jynj")
p longest_sub_string("asjrgapa")
p longest_sub_string("busvutpwmu")
p longest_sub_string("gaaqfeqlqky")