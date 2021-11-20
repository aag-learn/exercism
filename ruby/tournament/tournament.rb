class Tournament

    def initialize input 
        @input = input
        compute
    end


    def formatted_results
        head = "Team                           | MP |  W |  D |  L |  P\n"
        body = results.
                map{ |k,v| [k, v] }.
                sort{ |a,b| a[1][:points] != b[1][:points] ? b[1][:points]<=>a[1][:points] : (a[0]<=>b[0]) }.
                map do |item|
                    key = item[0]
                    value = item[1]
                    "%-31s|%3d |%3d |%3d |%3d |%3d" % [ key, value[:played], value[:wins], value[:draw], value[:loss], value[:points] ]
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
    
    attr_accessor :results
    attr_reader   :input

    def compute 
        # Hash default values. See https://medium.com/klaxit-techblog/a-headache-in-ruby-hash-default-values-bf2706660392
        self.results = Hash.new { |hash, key| hash[key] = {wins: 0, loss: 0, draw: 0, played: 0, points: 0} }
        
        input.split("\n") do |line|
            local_team, visitor_team, result = line.split(';')
            results[local_team][:played] += 1
            results[visitor_team][:played] += 1
            
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
        results.each{|k, v| v[:points] = v[:wins]*3 + v[:draw] }

    end
end