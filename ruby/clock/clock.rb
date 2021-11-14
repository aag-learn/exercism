class Clock

    attr_reader :minute, :hour

    def initialize hour: 0, minute: 0
        @minute = minute % 60
        @hour   = (hour + (minute / 60.0).floor) % 24
    end

    def to_s
        "%02d:%02d" % [@hour, @minute]
    end

    def + clock
        Clock.new(hour: hour + clock.hour, minute: minute + clock.minute)
    end

    def - clock
        Clock.new(hour: hour - clock.hour, minute: minute - clock.minute)
    end

    def == clock
        hour == clock.hour and minute == clock.minute
    end
end
