module TwelveDays
    PRESENTS = [
        "a Partridge in a Pear Tree",
        "two Turtle Doves",
        "three French Hens",
        "four Calling Birds",
        "five Gold Rings",
        "six Geese-a-Laying",
        "seven Swans-a-Swimming",
        "eight Maids-a-Milking",
        "nine Ladies Dancing",
        "ten Lords-a-Leaping",
        "eleven Pipers Piping",
        "twelve Drummers Drumming"
    ]
    ORDINAL = ['first', 'second', 'third', 'fourth', 'fifth', 'sixth', 'seventh', 'eighth', 'ninth', 'tenth', 'eleventh', 'twelfth']
    
    def self.song 
        song = []
        PRESENTS.each_with_index do |item, i|
            if i == 0 
                song.push "On the #{ORDINAL[i]} day of Christmas my true love gave to me: #{PRESENTS[i]}."
            else
                presents = (1..i).map{|i| "#{PRESENTS[i]}"}.reverse.join(', ') + ", and #{PRESENTS[0]}"
                song.push "On the #{ORDINAL[i]} day of Christmas my true love gave to me: #{presents}."
            end
        end
        song.join("\n\n")+"\n"
    end
end
