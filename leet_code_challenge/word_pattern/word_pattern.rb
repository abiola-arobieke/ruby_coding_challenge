def word_pattern(pattern, s)
  pattern = pattern.chars
  s = s.split()

  uniq_pattern = pattern.uniq()
  uniq_s = s.uniq()

  return false unless uniq_pattern.length == uniq_s.length

  pat_str = {}
  new_arr = []

  i = 0
  while i < uniq_pattern.length
    pat_str[uniq_pattern[i]] = uniq_s[i]
    i += 1
  end

  p pat_str

  for letter in pattern
     new_arr << pat_str[letter]
  end

 
  new_arr == s
  
end


p word_pattern("abba", "dog cat cat dog")
p word_pattern("abba", "dog cat cat fish")
p word_pattern("aaa", "dog cat cat dog")
p word_pattern("aba", "dog cat cat")
