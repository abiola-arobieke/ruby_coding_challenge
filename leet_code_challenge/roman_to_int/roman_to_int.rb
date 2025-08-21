def roman_to_int(s)
  roman_symbols = {"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}
  roman_arr = s.chars
  num = 0
 
  i = 0

  while i < roman_arr.length
    if roman_arr[i] == "M"
        num += roman_symbols["M"]
    elsif roman_arr[i] == "D"
      num += roman_symbols["D"]
    elsif roman_arr[i] == "C" && roman_arr[i + 1] == "M"
      num += 900
      roman_arr.delete_at(i + 1)
    elsif roman_arr[i] == "C" && roman_arr[i + 1] == "D"
      num += 400
      roman_arr.delete_at(i + 1)
    elsif roman_arr[i] == "C"
      num += roman_symbols["C"]
    elsif roman_arr[i] == "L"
      num += roman_symbols["L"]
    elsif roman_arr[i] == "X" && roman_arr[i + 1] == "C"
        num += 90
        roman_arr.delete_at(i + 1)
    elsif roman_arr[i] == "X" && roman_arr[i + 1] == "L"
        num += 40
        roman_arr.delete_at(i + 1)
    elsif roman_arr[i] == "X"
        num += roman_symbols["X"]
    elsif roman_arr[i] == "V"
      num += roman_symbols["V"]
    elsif roman_arr[i] == "I" && roman_arr[i + 1] == "X"
        num += 9
        roman_arr.delete_at(i + 1)
    elsif roman_arr[i] && roman_arr[i + 1] == "V"
        num += 4
        roman_arr.delete_at(i + 1)
    else
        num += roman_symbols["I"]
    end

    i += 1
  end

 return num

end

p roman_to_int("MMXLI")
p roman_to_int("MCDXLV")

p roman_to_int("DCXXI")