#!/usr/bin/env ruby

# Takes three inputs:
# 1) The number of bytes to skip
# 2) The number of bytes in each chunk
# 3) The number of interval between chunks

class BitExtractor
  def initialize(file)
    @file = File.open(file, "rb")
  end

  def extract(offset, chunk_interval, chunk_size)
    out = ""

    # Skip first n bytes
    @file.read(offset)

    # Now work magic
    while block = @file.read(chunk_interval)
      out << block.chars.first(chunk_size).join
    end

    puts out
  end
end
