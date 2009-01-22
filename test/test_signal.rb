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

  context "cmuxing" do
    setup do
      @left = DSP::Signal.new([1, 2, 3, 4, 5])
      @right = DSP::Signal.new([2, 3, 4])
    end

    should "not modify the signals" do
      @left.cmux(@right)
      assert_equal [2, 3, 4], @right
    end
    
    should "mux signals of the same size" do
      assert_equal [[2, 2], [3, 3], [4, 4]], @right.cmux(@right)
    end

    should "mux a smaller signal" do
      assert_equal [[1, nil], [2, 2], [3, 3], [4, 4], [5, nil]], @left.cmux(@right)
    end

    should "mux a larger signal" do
      assert_equal [[1, nil], [2, 2], [3, 3], [4, 4], [5, nil]], @right.cmux(@left)
    end

    should "mux a smaller signal with odd size" do
      assert_equal [[2, 1], [3, 2], [4, nil]], @right.cmux([1, 2])
    end

    should "mux a larger signal with odd size" do
      assert_equal [[1, 2], [2, 3], [3, 4], [4, nil]], @right.cmux([1, 2, 3, 4])
    end
  end
end
