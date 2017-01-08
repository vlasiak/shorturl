class UrlShortener
  ALPHABET = 'F4GP62N8qMrm3wj9bRVf5vh7TskCnDpzWtXQSKdxcBgHLJZ'
  BASE = ALPHABET.length

  def self.encode(number)
    number = NumberMapper.new(number).encrypt
    hash = ''

    while number > 0 do
      number, index = number.divmod(BASE)
      hash += ALPHABET[index]
    end

    hash
  end

  def self.decode(hash)
    number = 0

    hash.each_char.with_index do |char, index|
      number += ALPHABET.index(char) * BASE ** index
    end

    NumberMapper.new(number).decrypt
  end
end
