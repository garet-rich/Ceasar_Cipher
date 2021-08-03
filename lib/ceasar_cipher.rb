class CeasarCipher
  attr_accessor :text, :factor

  def initialize(text, factor)
    @text = text
    @factor = factor
  end

  def translate
    return_string = ""

    @text.split("").each do |letter|
      char = letter.ord < 91 ? 65 : 97

      if letter.ord.between?(97, 122) || letter.ord.between?(65, 90)
        return_string << ((((letter.ord - char) + factor) % 26) + char).chr
      else
        return_string << letter
      end
    end

    return_string
  end
end