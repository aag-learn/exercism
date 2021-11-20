class Tournament

    def initialize input 
        @input = input
        compute
    end


    def formatted_results
        head = "Team                           | MP |  W |  D |  L |  P\n"
        body = teams.
                sort_by{ |team| [-team[:points], team[:name]] }.
                map do |team|
                    "%-31s|%3d |%3d |%3d |%3d |%3d" % [ team[:name], team[:played], team[:wins], team[:draw], team[:loss], team[:points] ]
                end.join("\n")
        if body.empty?
            head
        else
            head + body + "\n"
        end
    end

    def self.tally input
        new(input).formatted_results
    end

    private
    
    attr_accessor :teams
    attr_reader   :input

    def compute 
        # Hash default values. See https://medium.com/klaxit-techblog/a-headache-in-ruby-hash-default-values-bf2706660392
        results = Hash.new { |hash, key| hash[key] = {name: key, wins: 0, loss: 0, draw: 0, played: 0, points: 0} }
        
        input.split("\n") do |line|
            local_team, visitor_team, result = line.split(';')
            case result
            when 'win' then 
                results[local_team][:wins] += 1
                results[visitor_team][:loss] += 1
            when 'draw' then
                results[local_team][:draw] += 1 
                results[visitor_team][:draw] += 1
            when 'loss' then
                results[local_team][:loss] += 1 
                results[visitor_team][:wins] += 1
            end
        end
        self.teams = results.map do |k, v| 
            v[:points] = v[:wins]*3 + v[:draw] 
            v[:played] = v[:wins] + v[:draw] + v[:loss]
            v
        end
    end
end
