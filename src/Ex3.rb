#!/usr/bin/env ruby
#http://bioruby.org/rdoc/Bio/NCBI/REST/ESearch/Methods.html
#https://gist.github.com/jprewitt/1655444
require 'bio'


if ARGV.length != 3
  puts 'Invalid params: 1) In file path - 2) Pattern - 3) Out file path'
  exit
end

pattern = ARGV[1]
Bio::NCBI.default_email = "@"
genbank_id = Bio::NCBI::REST::ESearch.search("nucleotide", "168480").first
genbank_string = Bio::NCBI::REST::EFetch.nucleotide(genbank_id)
# genbank_id = Bio::NCBI::REST::ESearch.search("nucleotide", "118595760").first
# genbank_string = Bio::NCBI::REST::EFetch.nucleotide(genbank_id)

genbank_parsed = Bio::GenBank.new(genbank_string)

Bio::Blast.reports(ARGV[0]) do |report|
  # puts "Hits for " + report.query_def + " against " + report.db
  # report.each do |hit|
    # print hit.target_id, " -> ", hit.evalue if hit.evalue < 0.001
  # end
end

File.open(ARGV[2], 'w') do |f|
  f.puts(genbank_parsed.definition)
  f.puts(genbank_parsed.seq)
end
