# a)
require "test/unit"

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}

  def in(currency)
    singular_currency = currency.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    elsif singular_currency == "dollar"
      self
    else
      super
    end
  end

  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    elsif singular_currency == "dollar"
      self
    else
      super
    end
  end
end

class TestNumeric < Test::Unit::TestCase
  def test
    # First step
    assert_equal(1.dollar, 1)
    assert_equal(24.dollars, 24)
    assert_equal(3.yen, 0.039)
    assert_equal(2.rupee, 0.038)
    assert_equal(10.euros, 12.92)

    # Second step
    assert_equal(4.in(:dollar), 4)
    assert_equal(0.13.in(:yens), 10)
    assert_equal(1292.in(:euros), 1000)
    assert_equal(0.057.in(:rupees), 30)
  end
end

# b)
class String
  def palindrome?
    self.downcase.gsub(/\W+/, '') == self.downcase.gsub(/\W+/, '').reverse
  end
end

# c)
module Enumerable
  def palindrome?
    reverse_each.to_a == to_a
  end
end
