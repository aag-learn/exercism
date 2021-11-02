module ResistorColorDuo
    @@color_map = {
        'black' => 0,
        'brown' => 1,
        'red'   => 2,
        'orange' => 3,
        'yellow' => 4,
        'green'  => 5,
        'blue'   => 6,
        'violet' => 7,
        'grey'   => 8,
        'white'  => 9
    }.freeze

    def self.value colors
        colors[0..1].sum(''){|color| @@color_map[color].to_s}.to_i
    end
end
