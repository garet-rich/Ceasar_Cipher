require 'rspec'
require './lib/ceasar_cipher'

describe CeasarCipher do
  describe "#initialize" do
    it "is an instance of CeasarCipher" do
      ceasar_cipher = CeasarCipher.new("This is a test", 5)
      expect(ceasar_cipher).to be_a CeasarCipher
      expect(ceasar_cipher.text).to eq "This is a test"
      expect(ceasar_cipher.factor).to eq 5
    end
  end

  describe "#translate" do
    it "can shift small positive numbers" do
      ceasar_cipher = CeasarCipher.new("Take a left.", 3)
      expect(ceasar_cipher.translate).to eq "Wdnh d ohiw."
    end

    it "can shift small negative numbers" do
      ceasar_cipher = CeasarCipher.new("Does the room seem hot?", -5)
      expect(ceasar_cipher.translate).to eq "Yjzn ocz mjjh nzzh cjo?"
    end

    it "can shift large positive numbers" do
      ceasar_cipher = CeasarCipher.new("Woah dude!", 86)
      expect(ceasar_cipher.translate).to eq "Ewip lclm!"
    end

    it "can shift large negative numbers" do
      ceasar_cipher = CeasarCipher.new("Far out man.", -120)
      expect(ceasar_cipher.translate).to eq "Pkb yed wkx."
    end

    it "maintains spaces and capitalization" do
      ceasar_cipher = CeasarCipher.new("2 is a test, Ya? 3 is not.  ", 0)
      expect(ceasar_cipher.translate).to eq "2 is a test, Ya? 3 is not.  "
    end
  end
end