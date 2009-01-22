module DSP
  class MovingAverage
    attr_accessor :data
    attr_accessor :points
    attr_accessor :passes
    
    def initialize
      @data   = []
      @points = 1
      @passes = 1
      yield(self)
    end

    def results
      d = @data
      @passes.times do
        d = calculate(d)
      end
      d
    end

    private
    def calculate(d)
      output = Array.new(d.size, 0)
      ((@points/2)...(d.size - (@points/2))).each do |i|
        output[i] = 0
        (-(@points/2)..(@points/2)).each do |j|
          output[i] = output[i] + d[i+j]
        end
        output[i] = output[i]/@points
      end
      output
    end
  end
end
