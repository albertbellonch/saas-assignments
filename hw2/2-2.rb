require "test/unit"

class CartesianProduct
  include Enumerable

  def initialize(a, b)
    @a = a
    @b = b
  end

  def each
    @a.each do |ae|
      @b.each do |be|
        yield [ae,be]
      end
    end
  end
end

class CartesianProductTest < Test::Unit::TestCase
  def test
    assert_equal(CartesianProduct.new([:a,:b], [4,5]).to_a, [[:a,4], [:a,5], [:b,4], [:b, 5]])
    assert_equal(CartesianProduct.new([:a,:b], []).to_a, [])
  end
end
