def int_to_roman(num)
  roman_symbols = {"1" => "I", "5" => "V", "10" => "X", "50" => "L", "100" => "C", "500" => "D", "1000" => "M"}
  num_str_arr = num.to_s.chars
  nearest_zero_count = num_str_arr.length - 1
  result = ""
  
  i = 0

  while i < num_str_arr.length
    num_str_arr[i] += "0" * nearest_zero_count
    len = num_str_arr[i].length
    if len >= 4
      val = (num_str_arr[i].to_i) / 1000
      result += roman_symbols["1000"] * val
     
    elsif len == 3
        if num_str_arr[i].to_i == 900
          result += roman_symbols["100"] + roman_symbols["1000"]
        elsif num_str_arr[i].to_i > 500 && num_str_arr[i].to_i < 900
          result += roman_symbols["500"]
          val = ((num_str_arr[i].to_i) - 500) / 100
          result += roman_symbols["100"] * val
        elsif num_str_arr[i].to_i == 500
          result += roman_symbols["500"]
        elsif num_str_arr[i].to_i == 400
          result += roman_symbols["100"] + roman_symbols["500"]
        else
          val = num_str_arr[i].to_i / 100
          result += roman_symbols["100"] * val
        end
    elsif len == 2
      if num_str_arr[i].to_i == 90
        result += roman_symbols["10"] + roman_symbols["100"]
      elsif num_str_arr[i].to_i > 50 && num_str_arr[i].to_i < 90
        result += roman_symbols["50"]
        val = ((num_str_arr[i].to_i) - 50) / 10
        result += roman_symbols["10"] * val
      elsif num_str_arr[i].to_i == 50
        result += roman_symbols["50"]
      elsif num_str_arr[i].to_i == 40
        result += roman_symbols["10"] + roman_symbols["50"]
      else
        val = ((num_str_arr[i].to_i)) / 10
        result += roman_symbols["10"] * val
      end
    elsif len == 1
      if num_str_arr[i].to_i == 9
        result += roman_symbols["1"] + roman_symbols["10"]
      elsif num_str_arr[i].to_i > 5 && num_str_arr[i].to_i < 9
        result += roman_symbols["5"]
        val = (num_str_arr[i].to_i) - 5
        result += roman_symbols["1"] * val
      elsif num_str_arr[i].to_i == 5
        result += roman_symbols["5"]
      elsif num_str_arr[i].to_i == 4
        result += roman_symbols["1"] + roman_symbols["5"]
      else
        val = (num_str_arr[i].to_i)
        result += roman_symbols["1"] * val
      end
    end
    nearest_zero_count -= 1
    i += 1
  end
  
  result

end

p int_to_roman(3899)