class EDH
     public
     def self.check_cards(s)
         s.gsub!(/[^0-9]/, "")
         ss = s.reverse.split(//)

         alternate = false
         total = 0
         ss.each do |c|
             if alternate
               total += double_it(c.to_i)
             else
               total += c.to_i
           end
           alternate = !alternate
         end
       (total % 10) == 0
     end

   private
   def self.double_it(i)
       i = i * 2
       if i > 9
         i = i % 10 + 1
     end
     i
   end
 end


def bank(s)
  s = s.to_s.gsub(/\D/, "")

  return :AMEX if s.length == 15 && s =~ /^3[47]/
  return :VISA if [13,16].include?(s.length) && s =~ /^4/
  return :MasterCard if s.length == 16 && s =~ /^5[1-5]/
  return :Discover if s.length == 16 && s =~ /^6011/
  return :Unknown if s.length == 16 && s =~ /^9111/
  return nil
end

 if $0 == __FILE__
   def card_number(s)
       result = EDH::check_cards(s)
       if result
         puts "#{bank(s)}: #{s} (valid)"

       else
                 puts "#{bank(s)}: #{s} (invalid)"
               end
   end

   card_number('4111111111111111')
   card_number('4111111111111')
   card_number('4012888888881881')
   card_number('378282246310005')
   card_number('6011111111111117')
   card_number('5105105105105100')
   card_number('5105 1051 0510 5106')
   card_number('9111111111111111')
 end
