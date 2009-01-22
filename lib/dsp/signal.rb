module DSP
  class Signal < Array
    def mean
      inject(0) { |acc, n| acc + n} / size
    end

    def variance
      the_mean = mean
      inject(0) { |acc, n| acc + ((n - the_mean)**2) }
    end

    def stddev
      Math.sqrt(variance)
    end
  end
end
