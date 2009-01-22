require 'test/dsp_test_setup'

class TestSignal < Test::Unit::TestCase
  context "calculations" do
    should "mean should calculate the mean" do
      assert_equal 3, DSP::Signal.new([1, 2, 3, 4, 5]).mean
    end

    should "variance should calculate the variance" do
      assert_equal 10, DSP::Signal.new([1, 2, 3, 4, 5]).variance
    end

    should "stddev should calculate the std deviation" do
      assert_in_delta 3.16227766016838, DSP::Signal.new([1, 2, 3, 4, 5]).stddev, 0.001
    end
  end
end
