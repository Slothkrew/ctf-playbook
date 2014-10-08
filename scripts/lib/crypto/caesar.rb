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
      puts Caesar.new(num).decrypt(text)
    end
  end

  # Uses a little magic to determine the most likely plaintext
  # E is the most common letter in the language, so we can work from there and
  # do some frequency analysis on our ciphertext to judge the likely key
  # Alternate idea/code: https://gist.github.com/bt3gl/a8617848ccb37e56034d
  def Caesar.smart_caesar(text)
    puts "five most likely plaintexts:"
    text.downcase!

    alphabet = ('a'..'z').to_a.join

    text_mangled = text.gsub(/[^a-z]/,"")

    frequencies = Caesar
                    .letter_frequencies(text_mangled)
                    .sort { |a, b| a[1] > b[1] ? -1 : (a[1] < b[1] ? 1 : (a[1] <=> b[1])) }

    (0..5).each do |num|
      key = (alphabet.index("e") - alphabet.index(frequencies[num][0])).abs
      puts "#{num}: #{Caesar.new(key).decrypt(text)}"
    end
  end

  private
  def Caesar.letter_frequencies(str)
    str.downcase.each_char.with_object({}) do |c,h|
      (h[c] = h.fetch(c,0) + 1) if c =~ /[a-z]/
    end
  end
end

# Example
ciphertext = "MABL BL TG XQTFIEX HY MAX LEHMADKXP VTXLTK VBIAXK UKXTDXK'L KTP IHPXK!"

puts "[+] dumb caesar example"
Caesar.dumb_caesar(ciphertext)

puts "\n[+] smart caesar example"
Caesar.smart_caesar(ciphertext)
