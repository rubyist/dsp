require 'test/dsp_test_setup'

class TestMovingAverage < Test::Unit::TestCase
  context "single pass" do
    should "calculate a single pass correctly" do
      ma = DSP::MovingAverage.new do |m|
        m.data = [5, 4, 2, 3, 8, 1, 7, 7, 6, 7]
        m.points = 3
        m.passes = 1
      end

      assert_equal [0, 3, 3, 4, 4, 5, 5, 6, 6, 0], ma.results
    end

    should "calculate multiple passes correctly" do
      ma = DSP::MovingAverage.new do |m|
        m.data = [5, 4, 2, 3, 8, 1, 7, 7, 6, 7]
        m.points = 3
        m.passes = 2
      end

      assert_equal [0, 2, 3, 3, 4, 4, 5, 5, 4, 0], ma.results
    end
  end
end
