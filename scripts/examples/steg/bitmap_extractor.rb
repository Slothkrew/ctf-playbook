#!/usr/bin/env ruby
require_relative "../../lib/steg/bitmap_extractor.rb"

be = BitmapExtractor.new("bit_extract_me.bmp")
puts be.extract("blue")
