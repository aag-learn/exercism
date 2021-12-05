class SpaceAge
    EARTH_DAYS = 365.25
    ORBITAL_PERIOD = {
        mercury: 0.2408467,
        venus: 0.61519726,
        earth: 1.0,
        mars: 1.8808158 ,
        jupiter: 11.862615,
        saturn: 29.447498,
        uranus: 84.016846,
        neptune: 164.79132
    }

    ORBITAL_PERIOD.keys.each do |planet|
        define_method("on_#{planet}") do
            years_on planet
        end
    end

    # def method_missing method_name
    #     if /on_(?<planet>\w+)/ =~ method_name 
    #         send(:years_on, planet.to_sym)
    #     else
    #         super
    #     end
    # end

    def initialize seconds
        @seconds = seconds
    end

    private 

    attr_reader :seconds

    def years_on planet
        seconds.to_f / (EARTH_DAYS * ORBITAL_PERIOD[planet] * 24.0 * 60.0 * 60.0)
    end
end
