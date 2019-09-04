module Luhn
    def self.is_valid?(card_num)
        #break the credit card number into individual number
        ind_num = card_num.to_s.each_char.map{|n|n.to_i} 
        # starting from the right, double every second digit
        ind_num = []
        num_to_sum = []
        num_to_sum = ind_num.reverse.each_with_index do |ind_num,idx|
            if num_to_sum.length.odd?
                if idx %2 != 0 
                    if num_to_sum[idx] >= 10
                        num_to_sum[idx] = (ind_num*2)-9
                    else
                        num_to_sum[idx]= ind_num * 2
                    end
                end
            end
        end
        sum = num_to_sum.inject(0){|sum, x| sum + x }
            #if sum is divisible by 10, it's a valid number, otherwise it's invalid
            if sum %10 == 0
                return true
            else
                return false
            end

    end
end
