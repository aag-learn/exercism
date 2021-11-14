class Clock
    include Comparable
    attr_reader :minute

    def initialize hour: 0, minute: 0
        @minute = ( minute + (hour * 60) ) % (24*60)
    end

    def to_s
        "%02d:%02d" % [minute / 60, minute % 60]
    end

    def + clock
        Clock.new(hour: 0, minute: minute + clock.minute)
    end

    def - clock
        Clock.new(hour: 0, minute: minute - clock.minute)
    end

    def <=> clock
        minute <=> clock.minute
    end
end
