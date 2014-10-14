#!/usr/bin/env ruby

# Takes three inputs:
# 1) The number of bytes to skip
# 2) The number of bytes in each chunk
# 3) The number of interval between chunks

class BitmapExtractor
  def initialize(file)
    @file = File.open(file, "r")
  end

  def extract(colour)
    puts "[+] Extracting values from #{colour} pixels"

    puts "    TYPE:   #{image_type(@file.read(2))}"
    puts "    LENGTH: #{@file.read(4).unpack('s*')[0]}"

    @file.read(4) # Don't currently care about this stuff

    puts "    START:  #{@file.read(4).unpack('s*')[0]}"   
  end

  def image_type(header)
    case header
    when "BM"
      "Windows 3.1x, 95, NT, ... etc."
    when "BA"
      "OS/2 struct Bitmap Array"
    when "CI"
      "OS/2 struct Color Icon"
    when "CP"
      "OS/2 const Color Pointer"
    when "IC"
      "OS/2 struct Icon"
    when "PT"
      "OS/2 Pointer"
    end
  end

end
