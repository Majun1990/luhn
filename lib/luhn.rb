module Luhn
    def self.is_valid?(card_num)
        #break the credit card number into individual number
        ind_num = card_num.to_s.each_char.map{|n|n.to_i} 
        # starting from the right, double every second digit
        num_to_sum = []
        ind_num.reverse.map.with_index do |ind_num,idx|
            if idx %2 == 0
                num_to_sum << ind_num
            else
                dbl_num = ind_num * 2
                # if doubled number is equal or greater than 10, take the value and subtract 9
                if dbl_num >= 10
                    num_to_sum << dbl_num - 9
                end
            end
        end
        #sum the digits
        if num_to_sum.length.even?
        sum = num_to_sum.inject(0){|sum, x| sum + x }
            #if sum is divisible by 10, it's a valid number, otherwise it's invalid
            if sum %10 == 0
                return true
            else
                return false
            end
        else
        sum = num_to_sum.inject(0){|sum, x| sum + x }
        check_digit = (sum * 9)%10
        odd_cc = sum + check_digit
            #if odd_cc is divisible by 10, it's a valid number, otherwise it's invalid
            if odd_cc %10 == 0
                return true
            else
                return false
            end
        end

    end
end