#!/usr/bin/env ruby
require_relative "../../lib/steg/bit_extractor.rb"

be = BitExtractor.new("extract_me.txt")
be.extract(0, 0, 0)
