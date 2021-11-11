module Luhn
    def self.valid? input

        doubled = input.
                  gsub(/\s/, '').
                  tap{|o| return false if o =~ /[^\d]/ || o == "0"}.
                  chars.
                  reverse.
                  map.with_index do |i, index|
                      number = i.to_i
                      if 0 != index % 2
                          number <= 4 ? number * 2 : number * 2 - 9
                      else
                          number
                      end
                  end

        doubled.sum % 10 == 0
    end
end