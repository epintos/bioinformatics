#!/usr/bin/env ruby

puts 'Exercise 2'
# sudo makeblastdb -in ../data/swissprot.fasta -out ../data/swissprot -dbtype nucl
require 'bio'

# Bio::Blast.reports(ARGF) do |report|
#   puts "Hits for " + report.query_def + " against " + report.db
#   # report.each do |hit|
#     # print hit.target_id, " -> ", hit.evalue if hit.evalue < 0.001
#   # end
# end

blast_factory = Bio::Blast.new('blastn','dbsts', '-e 0.0001 -r 4', 'genomenet')
# result = blast_factory.query
# ('DIADIIRGKDLYLGDQERKQHLEKRLETMFEKIQKNNNNKLSNLSTKEVREYWWALNRDQVWKAITCDAGAADEYFKKSGKLEFEFTGGQCGRDGENVPTYLDYVPQFFR')

#  result.each do |hit|
#       puts hit.bit_score        # bit score (*)
#       puts hit.query_seq        # query sequence (TRANSLATOR'S NOTE:
# sequence of homologous region of query sequence)
#       puts hit.midline          # middle line string of alignment of
# homologous region (*)
#       puts hit.target_seq       # hit sequence (TRANSLATOR'S NOTE: sequence
# of homologous region of query sequence)

#       puts hit.evalue           # E-value
#       puts hit.identity         # % identity
#       puts hit.overlap          # length of overlapping region
#       puts hit.query_id         # identifier of query sequence
#       puts hit.query_def        # definition(comment line) of query sequence
#       puts hit.query_len        # length of query sequence
#       puts hit.target_id        # identifier of hit sequence
#       puts hit.target_def       # definition(comment line) of hit sequence
#       puts hit.target_len       # length of hit sequence
#       puts hit.query_start      # start position of homologous region in
# query sequence
#       puts hit.query_end        # end position of homologous region in query
# sequence
#       puts hit.target_start     # start position of homologous region in
# hit(target) sequence
#       puts hit.target_end       # end position of homologous region in
# hit(target) sequence
#       puts hit.lap_at           # array of above four numbers
    # end
# report = remote_blast_factory.query(ARGF.read)     
# puts report                                    
# report.each do |hit|
#   print hit.target_id, " -> ", hit.evalue if hit.evalue < 0.001
# end

# example 1
seq = Bio::Sequence::NA.new('agggcattgccccggaagatcaagtcgtgctcctg')
report = blast_factory.query(seq)
report.each do |hit|
  print hit.target_id, " -> ", hit.evalue if hit.evalue < 0.001
end
# example 2
# str <<END_OF_FASTA
# >lcl|MySequence
# MPPSAISKISNSTTPQVQSSSAPNLTMLEGKGISVEKSFRVYSEEENQNQHKAKDSLGF
# KELEKDAIKNSKQDKKDHKNWLETLYDQAEQKWLQEPKKKLQDLIKNSGDNSRVILKDS
# END_OF_FASTA
# report = blast_factory.query(str)