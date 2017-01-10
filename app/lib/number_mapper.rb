# The algorithm is based on the Affine cipher
# (Symmetric bijective algorithm for positive integers)

class NumberMapper
  BASE = 1073741789
  SECRET = 173741789
  SHIFT = 507371178
  INVERSE = 237183726

  def initialize(number)
    raise ArgumentError unless number.kind_of? Integer
    @number = number
  end

  def encrypt
    (SECRET * number + SHIFT ) % BASE
  end

  def decrypt
    (INVERSE * (number - SHIFT)) % BASE
  end

  private

  attr_reader :number
end
