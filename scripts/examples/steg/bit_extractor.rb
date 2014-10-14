#!/usr/bin/env ruby
require_relative "../../lib/steg/bit_extractor.rb"

# bit_extract_me.bmp is a 10x10 24bit bmp composed entirely of the colour blue.
# (#0000ff). With the correct offset, we should be able to extract only FF,
# showing that we're successfully getting only the hex values we want from the
# file

offset =  54 # Skip bmp headers

(0..100).each do |num|
  be = BitExtractor.new("bit_extract_me.bmp")
  File.open("output_#{num}", "w").write(be.extract(num, 3, 1))
end
