class UrlShortener
  ALPHABET = 'F4GP62N8qMrm3wj9bRVf5vh7TskCnDpzWtXQSKdxcBgHLJZ'
  BASE = ALPHABET.length

  def self.encode(number)
    raise ArgumentError unless number.kind_of? Integer

    number, hash = NumberMapper.new(number).encrypt, ''
    while number > 0 do
      number, index = number.divmod(BASE)
      hash += ALPHABET[index]
    end

    hash
  end

  def self.decode(hash)
    raise ArgumentError unless hash.is_a? String

    number = 0
    hash.each_char.with_index do |char, index|
      number += ALPHABET.index(char).to_i * BASE ** index
    end

    NumberMapper.new(number).decrypt
  end
end
