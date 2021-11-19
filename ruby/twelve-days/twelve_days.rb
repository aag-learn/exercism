module TwelveDays
    PRESENTS = [
        "Partridge in a Pear Tree",
        "Turtle Doves",
        "French Hens",
        "Calling Birds",
        "Gold Rings",
        "Geese-a-Laying",
        "Swans-a-Swimming",
        "Maids-a-Milking",
        "Ladies Dancing",
        "Lords-a-Leaping",
        "Pipers Piping",
        "Drummers Drumming"
    ]
    NUMBERS = ['a', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve']
    ORDINAL = ['first', 'second', 'third', 'fourth', 'fifth', 'sixth', 'seventh', 'eighth', 'ninth', 'tenth', 'eleventh', 'twelfth']
    
    def self.song 
        song = []
        PRESENTS.each_with_index do |item, i|
            if i == 0 
                song.push "On the #{ORDINAL[i]} day of Christmas my true love gave to me: #{NUMBERS[i]} #{PRESENTS[i]}."
            else
                previous = (1..i).map{|i| "#{NUMBERS[i]} #{PRESENTS[i]}"}.reverse.join(', ')
                song.push "On the #{ORDINAL[i]} day of Christmas my true love gave to me: #{previous}, and #{NUMBERS[0]} #{PRESENTS[0]}."
            end
        end
        song.join("\n\n")+"\n"
    end
end
