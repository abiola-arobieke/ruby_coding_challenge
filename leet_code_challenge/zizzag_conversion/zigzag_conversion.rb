def zigzag_conversion(s, num_rows)
  return if s.length == 1 || s.length <= num_rows

  str_arr = s.chars
  terms = 2 * (num_rows - 1)
  base_interval = terms
  head = terms
  stored_str_arr = []
  first_col_letters = str_arr.first(num_rows)
  zig_zag_letters = ""
  

  i = 0

  while i < first_col_letters.length
    unless i == first_col_letters.length - 1
      stored_str_arr << [first_col_letters[i], terms]
      terms -= 2
    else
      stored_str_arr << [first_col_letters[i], head]
    end
    i += 1
  end
  

  for i in 0...stored_str_arr.length
    head = stored_str_arr[i][1]
    tail = 0
    j = 0
    
    while j < str_arr.length
      if i == 0 || i == stored_str_arr.length - 1
        unless stored_str_arr[i][1] >= str_arr[i..].length || head > str_arr[i..].length
          new_arr = str_arr[i..]
          stored_str_arr[i][0] += new_arr[stored_str_arr[i][1]]
          stored_str_arr[i][1] += head
        end
      else
        unless stored_str_arr[i][1] >= str_arr[i..].length || head > str_arr[i..].length
          new_arr = str_arr[i..]
          if j == 0
            stored_str_arr[i][0] += new_arr[head]

            unless base_interval >= str_arr[i..].length
              stored_str_arr[i][0] += new_arr[base_interval]
            end
            
            head = head + base_interval
            tail = base_interval + base_interval
        
          else
            unless head >= str_arr[i..].length
              stored_str_arr[i][0] += new_arr[head]
            end
        
            unless tail >= str_arr[i..].length
              stored_str_arr[i][0] += new_arr[tail]
            end
            
            head += base_interval
            tail += base_interval
          end
        end
      end 
      j += 1
    end
  end

  zig_zag_letters = stored_str_arr.map {|result| result[0]}

 return zig_zag_letters.join()
end


# p zigzag_conversion("PAYPALISHIRINGTONSOFDEVELOPERINMYTOWNNOWQAb", 5) 
# p zigzag_conversion("ABCDE", 3)
# p zigzag_conversion("PAYPALISHIRING", 3)

p zigzag_conversion("zpaqojvamrjkdfwfsfjoblbhtjcpdbjdqkvevshhjssnzosstdgwqhelqibumkzcwujsnsbyktlkkgeflkectkpjuqfgdgjbduvqmxqysckekomvaqxtanfufmbktmmwijouieubifhsvtowjlrjawgijjuexiafsqbauvddclvaejyoxrzzohjzqefpmhugxxhtvmwzxuzcfzsertghbpittnjiudorbxmwkjvjfxnmwfrpzxwametiresniiglgtjsegdjfrvcyotxlqzawviqzcdjkkwsffkjoquthpxfgrfrjetfbdvdfbmqnlisqvbglvaumxbsqgmznffojcrqdggqrrijmlqzgstvpupidbhqjmgupakuitlzktkwhcxpuqkmmcupfbhoqokfovzwomxyijwpmteglrsztmpyowpemzlcumakzxkjhgyvbcbovuooifpybeeqdrsaetkfsvobdmwhqyvoujceotdsxhkbbcdfxnmqkatooqxgqswkebosutmsdwvebylynxqyzkonalvqfscjtqenmqhppetqceqsbhqcrgrttmjygnibdorreygvfblhfcbiltmczdvuqgtytdayrrqxrytwagghkhsvdezeiuzacuyvxawqrmplmkjmrpwbzqzcuygevhexbfvafrqzfikrstgjlenkuooqmwvhebhhgciovanaiztbszmffbrzpfscenlkqsrzwznrcctkbnnvoaduduvtanxgckqtfhsbjhvllovobllqlomqjhjlvgrxthsyqmzztukgliumtgeguqwdygovofuhonffzhevdrbozwdschawawcyeqvvypeocmtctaxyrapswsmybmxbkzbrrwmrmqgqcbuxdtwuuloqfargoqkzrlqiiecwukozljwpeulyharmc", 623)

# PAYPALISHIRINGTONSOFDEVELOPERINMYTOWN

# 3,1,3,1,3

# AYPLISIRIG
# first row => +3  P   A   H  N                  ==> 3 - 2 ==> 1  3 + 1 = 4
# secod row => +1  A P L S I I G  3 rows         ==> 4 - 2 ==> 2  4 - 2 = 2
# third row => +3  Y   I   R                     ==> 2 - 2 ==> 0  4 - 0 = 4

#4,1,1,4,1,1,4,1,1,4

# first row => +4    P   L    4 - 2 ==> 4 + 2 => 6
# secod row => +3     3 rows
# third row => +4

                            # n = (row - 2) + row ==>  2(row - 1)
                            # head = 2(row - 1)
                            # next = head - 2, tail ==> head - next
                            # 2next = tail - 2, new_tail ==> head - 2next
                            # 3next = newtail - 2,  2new_tail => head - 3next

 #5, 1, 1, 1,5,1,1,1,5
# P          H           N          L           Y           Q               5 row  5 - 2 = 3 ===> 5 + 3 => 8  
# A       S  I        O  S       E  O        M  T        W  A          8 - 2 = 6 ===>  8 - 6 => 2
# Y    I     R      T    O     V    P      N    O     O              6 - 2 = 4 ===>  8 - 4 => 4
# P  L       I   G       F   E      E   I       W  N                  4 - 2 = 2 ===>  8 - 2 => 6
# A          N           D          R           N                    2 - 2 = 0 ===>  8 - 0 ==> 8




#P          R               D              N              Q         6 row    6 - 2 = 4  ==> 6 + 4 => 10
#A       I  I            F  E           I  M           W  A           10 - 2 = 8 ==> 10 -8 => 2
#Y     H    N         O     V         R    Y         O -->         8 - 2 = 6  ==> 10 - 6 = 4
#P   S      G      S        E      E       T      N --->              6 - 2 = 4  ==> 10 - 4 = 6
#A I        T   N           L   P          O   N  -->               4 - 2 = 2  ===> 10 -2 = 8
#L          O               O              W                      2 - 2 = 0  ===> 10 - 0 = 10


#P                     O                      N                                     6 row    6 - 2 = 4  ==> 6 + 4 => 10
#A                   S F                   W  N                                   10 - 2 = 8 ==> 10 -8 => 2
#Y                N    D                O     O                           -->         8 - 2 = 6  ==> 10 - 6 = 4
#P             O       E             T        W                                              6 - 2 = 4  ==> 10 - 4 = 6
#A          T          V          Y           Q                          O   N  -->               4 - 2 = 2  ===> 10 -2 = 8
#L       G             E        M             A                     O              W                      2 - 2 = 0  ===> 10 - 0 = 10
#I     N               L      N               B
#S   I                 0    I
#H R                   P  R
#I                     E








# PAYPAL IS HIRING TONS OF DEVELOPER IN MY TOWN

# PAYPAL IS HIRING TONS OF DEVELOPER IN MY TOWN



# for i in 0..first_col_letters.length
#   j = 0
#   while j < str.length
#     if i == 0 && head < str.length
#       headers[i] += str[head]
#       head += terms
#     elsif i == 1 && !(nexthead >= str.length || tail >= str.length)
#       new_arr = str[i..]
#       headers[i] += new_arr[nexthead]
#       p nexthead
#       if nexthead % (terms - 2) == 0
#         nexthead += 2
#       else
#         nexthead += terms - 2
#         nexthead
#       end
#     end
#     j += 1
#   end
# end