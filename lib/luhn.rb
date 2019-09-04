module Luhn
    def self.is_valid?(card_num)
        #break the credit card number into individual number
        ind_num = card_num.to_s.split('')
        # starting from the right, double every second digit
        ind_num = []
        rev_num = ind_num.reverse
        rev_num =[]
        num_to_sum = []
        num_to_sum = rev_num.each_with_index do |rev_num,idx|
            if idx %2 != 0 
                num_sum +=  rev_num.to_i*2>9 ? (rev_num.to_i*2)-9 : rev_num.to_i * 2
            else
                num_sum += rev_num.to_i
            end
        end
            #if sum is divisible by 10, it's a valid number, otherwise it's invalid
            if num_sum %10 === 0
                return true
            else
                return false
            end

    end
end



