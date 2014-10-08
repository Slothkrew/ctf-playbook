#!/usr/bin/env ruby

outfile = File.open("README.md", "w")

[
  "introduction",
  "miscellaneous",
  "reverse_engineering",
  "web_security",
  "cryptography",
  "steganography"
].each do |section|
  outfile.write(File.open("playbook/#{section}.md").read)
  outfile.write("\n")
end

outfile.close
