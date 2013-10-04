#!/usr/bin/env ruby

puts 'Exercise 2'
require 'bio'
require 'rubygems'


 seq = Bio::Sequence::AA.new('GLSDGEWELVLKTWGKVEADIPGHGETVFVRLFTGHPETLEKFDKFKHLKTEGEMKASEDLKKQGVTVLT
ALGGILKKKGHHEAEIQPLAQSHATKHKIPIKYLEFISDAIIHVLQSKHPAEFGADAQGAMKKALELFRN
DIAAKYKELGFQG')

#Local
# blast = Bio::Blast.local('blastp','swissprot','-m 8')
#makeblastdb -in maize.fasta -out dbest -dbtype nucl
#blastp -query maize.fasta -db maize -out test.html -html
#blastn -query maize.fasta -db dbest -out test.html -html -remote

# Remote
# For proteins
blast = Bio::Blast.remote 'blastp', 'swissprot', '-e 0.0001', 'genomenet'

# For nucleic
# blast = Bio::Blast.remote 'blastn', 'dbest', '-e 0.0001', 'genomenet'
file = File.open("outputs/exercise2.out", "w+") 
  
report = blast.query(seq)
if !report.nil?
  report.hits.each_with_index do |hit, hit_index|
    file.puts '------------------------------------------------'
    file.puts "Hit #{hit_index}"
    file.puts hit.accession  
    file.puts hit.definition
    file.puts " - Query length: #{hit.len}"
    file.puts " - Number of identities: #{hit.identity}"
    file.puts " - Length of Overlapping region: #{hit.overlap}"
    file.puts " - % Overlapping: #{hit.percent_identity}"
    file.puts " - Query sequence: #{hit.query_seq}"
    file.puts " - Subject sequence: #{hit.target_seq}"
    hit.hsps.each_with_index do |hsps, hsps_index|
      file.puts " - Bit score: #{hsps.bit_score}"
      file.puts " - Gaps: #{hsps.gaps}"
    end
  end
end

file.close