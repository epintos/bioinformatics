#!/usr/bin/env ruby

puts 'Exercise 4'

require 'bio'


obj_A = Bio::EMBOSS.new('transeq -sbegin 110 -send 1171 embl:xlrhodop')
puts obj_A.result                   #=> nil
obj_A.exec
puts obj_A.result                   #=> a FASTA-formatted sequence

obj_B = Bio::EMBOSS.new('showfeat embl:xlrhodop')
obj_B.exec
puts obj_B.result
