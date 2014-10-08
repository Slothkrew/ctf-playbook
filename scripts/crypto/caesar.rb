#!/usr/bin/env ruby

class Caesar
  def initialize(shift, alphabet = ('a'..'z').to_a.join)
    i = shift % alphabet.size #I like this
    @decrypt = alphabet
    @encrypt = alphabet[i..-1] + alphabet[0...i]
  end

  def encrypt(string)
    string.tr(@decrypt, @encrypt)
  end

  def decrypt(string)
    string.tr(@encrypt, @decrypt)
  end

  # Takes the input text and vomits out every possible caesar rotation of it.
  def Caesar.dumb_caesar(text)
    text.downcase!

    (1..26).each do |num|
      puts Caesar.new(num).encrypt(text)
    end
  end

  # Uses a little magic to determine the most likely plaintext
  def Caesar.smart_caesar(text)
  end
end

# Example
ciphertext = "MABL BL TG XQTFIEX HY MAX LEHMADKXP VTXLTK VBIAXK UKXTDXK'L KTP IHPXK!"

puts "[+] dumb caesar example"
Caesar.dumb_caesar(ciphertext)

puts "\n[+] smart caesar example"
Caesar.smart_caesar(ciphertext)
