#!/usr/bin/env ruby

require 'bio'

if ARGV.length != 4
  puts 'Invalid params: 1) In file path - 2) Out file path - 3) Type ( --prot or --nuc ) - 4) Local or Remote ( --local or -- remote)'
  exit
end

#makeblastdb -in maize.fasta -out dbest -dbtype nucl
#blastn -query maize.fasta -db dbest -out test.html -html -remote
#blastp -query maize.fasta -db maize -out test.html -html

type = ARGV[2]
local_or_remote = ARGV[3]
if type.eql?('--prot')
  if local_or_remote.eql?('--local')
    blast = Bio::Blast.local('blastp','swissprot','-m 8')
    
  elsif local_or_remote.eql?('--remote')
    blast = Bio::Blast.remote 'blastp', 'swissprot', '-e 0.0001', 'genomenet'
  else
    puts 'Posible options are --local and --remote'
  end
elsif type.eql?('--nuc')
  if local_or_remote.eql?('--local')
    blast = Bio::Blast.local('blastn','dbest','-m 8')
    
  elsif local_or_remote.eql?('--remote')
    blast = Bio::Blast.remote 'blastn', 'dbest', '-e 0.0001', 'genomenet'
  else
    puts 'Posible options are --local and --remote'
  end
else
  puts 'Possible types are --prot and --nuc'
  exit
end

entries = Bio::FlatFile.open(Bio::FastaFormat, ARGV[0])

File.open(ARGV[1], 'w') do |f|
  entries.each_entry do |entry|
    report = blast.query(entry.seq)
    report.hits.each_with_index do |hit, hit_index|
      f.puts '------------------------------------------------'
      f.puts "Hit #{hit_index}"
      f.puts hit.accession  
      f.puts hit.definition
      f.puts " - Query length: #{hit.len}"
      f.puts " - Number of identities: #{hit.identity}"
      f.puts " - Length of Overlapping region: #{hit.overlap}"
      f.puts " - % Overlapping: #{hit.percent_identity}"
      f.puts " - Query sequence: #{hit.query_seq}"
      f.puts " - Subject sequence: #{hit.target_seq}"
      hit.hsps.each_with_index do |hsps, hsps_index|
        f.puts " - Bit score: #{hsps.bit_score}"
        f.puts " - Gaps: #{hsps.gaps}"
      end
    end
  end
end