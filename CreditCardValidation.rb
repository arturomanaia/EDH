def credit_card(number)
  number = number.to_s.gsub(/\D/, "")

  return false unless bank(number)
  number.reverse!

  relative_number = {'0' => 0, '1' => 2, '2' => 4, '3' => 6, '4' => 8, '5' => 1, '6' => 3, '7' => 5, '8' => 7, '9' => 9}

  sum = 0

  number.split("").each_with_index do |n, i|
    sum += (i % 2 == 0) ? n.to_i : relative_number[n]
  end

  sum % 10 == 0
end

def bank(number)
  number = number.to_s.gsub(/\D/, "")

  return :AMEX if number.length == 15 && number =~ /^3[47]/
  return :VISA if [13,16].include?(number.length) && number =~ /^4/
  return :MasterCard if number.length == 16 && number =~ /^5[1-5]/
  return :Discover if number.length == 16 && number =~ /^6011/
  return :Unknown if number.length == 16 && number =~ /^9111/
  return nil
end


while(true)
number = gets.chomp
break if number == "exit"
puts "#{bank(number)}: #{number} #{credit_card(number) ? '(valid)' : '(invalid)'}"

end
