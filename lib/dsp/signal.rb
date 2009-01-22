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
    def cmux(r)
      smaller, larger = self.size < r.size ? [self, r.dup] : [r.dup, self]
      pad_amount = (larger.size - smaller.size) / 2
      pad_amount.times do
        smaller.unshift nil
        smaller << nil
      end
      larger.zip(smaller)
    end
  end
end
