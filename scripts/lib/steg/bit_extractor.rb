#!/usr/bin/env ruby

# Takes three inputs:
# 1) The number of bytes to skip
# 2) The number of bytes in each chunk
# 3) The number of interval between chunks

class BitExtractor
  def initialize(file)
    @file = File.open(file, "rb")
  end

  def extract(offset, chunk_size, chunk_interval)
    puts @file.read
  end
end
