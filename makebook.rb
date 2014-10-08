#!/usr/bin/env ruby

outfile = File.open("README.md", "w")

outfile.write(File.open("readme-note.md").read)
outfile.write("\n")

[
  "introduction",
  "miscellaneous",
  "reverse_engineering",
  "web_security",
  "cryptography",
  "steganography",
  "exploitation"
].each do |section|
  outfile.write(File.open("playbook/#{section}.md").read)
  outfile.write("\n")
end

outfile.close
