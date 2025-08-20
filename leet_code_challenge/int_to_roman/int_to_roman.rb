def int_to_roman(num)
  roman_symbols = {"1" => "I", "5" => "V", "10" => "X", "50" => "L", "100" => "C", "500" => "D", "1000" => "M"}
  num_str_arr = num.to_s.chars
  nearest_zero_count = num_str_arr.length - 1
  result = ""
  
  i = 0

  while i < num_str_arr.length
    place_value = "1"
    num_str_arr[i] += "0" * nearest_zero_count
    num = num_str_arr[i].to_i
    len = num_str_arr[i].length
    place_value += "0" * nearest_zero_count
    place_value_int = place_value.to_i
  
    if len >= 4
      val = (num) / place_value_int
      result += roman_symbols[place_value] * val

    else
      if num == place_value_int * 9
        result += roman_symbols[place_value] + roman_symbols[(place_value_int * 10).to_s]
      elsif num > place_value_int * 5 && num < place_value_int * 9
        result += roman_symbols[(place_value_int * 5).to_s]
        val = ((num) - (place_value_int * 5)) / place_value_int
        result += roman_symbols[place_value] * val
      elsif num == place_value_int * 5
        result += roman_symbols[(place_value_int * 5).to_s]
      elsif num == place_value_int * 4
        result += roman_symbols[place_value] + roman_symbols[(place_value_int * 5).to_s]
      else
        val = num / place_value_int
        result += roman_symbols[place_value] * val
      end
    end
    nearest_zero_count -= 1
    i += 1
  end
  
  result

end

p int_to_roman(3899)