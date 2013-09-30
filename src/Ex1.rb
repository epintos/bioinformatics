#!/usr/bin/env ruby

puts 'Exercise 1'

require 'bio'

# read the sequence entry by entry through the files listed in ARGV.
entries = Bio::FlatFile.auto(ARGF)

# iterates on each entry to print the fasta formated string.
entries.each do |entry|
  name = entry.entry_id
  seq  = entry.naseq     # use aaseq method in the case of protein database
  # new_file = File.new(ARGF.filename.to_s, "w+") 
  # new_file << seq.to_fasta(name)
  # new_file.close
  puts seq.to_fasta(name)
end