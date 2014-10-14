#!/usr/bin/env ruby

# Takes three inputs:
# 1) The number of bytes to skip
# 2) The number of bytes in each chunk
# 3) The number of interval between chunks

class BitmapExtractor
  def initialize(file)
    @filename = file
    @file     = File.open(file, "r")
  end

  def extract(colour)
    puts "[+] Extracting values from #{colour} pixels"

    type   = image_type(@file.read(2))
    length = @file.read(4).unpack('s*')[0]
    @file.read(4) # Don't currently care about this stuff
    start  = @file.read(4).unpack('s*')[0]
    @file.read(4) # number of bytes in DIB header
    width  = @file.read(4).unpack('s*')[0]
    height = @file.read(4).unpack('s*')[0]

    puts "[-] main header"
    puts "    TYPE:    #{type}"
    puts "    LENGTH:  #{length}"
    puts "    START:   #{start}"  
    puts "[-] DIB header"
    puts "    WIDTH:   #{width}"
    puts "    HEIGHT:  #{height}"

    @file.close


    @file = File.open(@filename, "r")
    @file.read(start)

    height.times do
      width.times do
        puts @file.read(3).unpack('s*')[0]
      end
      @file.read(2)
    end
    
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
