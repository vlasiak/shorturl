class NumberMapper
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def encode
    ((number + 173741789) * 507371178) % 1073741789
  end

  def decode
    (number * 233233408 + 1073741789 - 173741789) % 1073741789
  end
end
