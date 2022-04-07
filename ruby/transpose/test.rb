require 'minitest/autorun'
require_relative 'transpose'

# Common test data version: 1.1.0 92bc877
class TransposeTest < Minitest::Test

  def test_first_line_longer_than_second_line
    # skip
    input = "The fourth line.\nThe fifth line."

    expected = "TT\nhh\nee\n  \nff\noi\nuf\nrt\nth\nh \n l\nli\nin\nne\ne.\n."

    assert_equal expected, Transpose.transpose(input)
  end

  def test_mixed_line_length
    # skip
    input = "The longest line.\nA long line.\nA longer line.\nA line."

    expected = "TAAA\nh   \nelll\n ooi\nlnnn\nogge\nn e.\nglr\nei \nsnl\ntei\n .n\nl e\ni .\nn\ne\n."

    assert_equal expected, Transpose.transpose(input)
  end

  def test_mixed_line_length
    # skip
    input = "AAAA\nBB\nCCC\nDD"

    expected = "ABCD\nABCD\nA C\nA"

    assert_equal expected, Transpose.transpose(input)
  end

  def test_triangle
    # skip
    input = "T\nEE\nAAA\nSSSS\nEEEEE\nRRRRRR"

    expected = "TEASER\n EASER\n  ASER\n   SER\n    ER\n     R"

    assert_equal expected, Transpose.transpose(input)
  end
end
