#!/usr/bin/env ruby

puts 'Exercise 3'
require 'bio'
require 'rubygems'

gb = Bio::GenBank.new('P02170.2')
file = File.open("outputs/exercise3.out", "w+") 
puts gb.seq_len
file.puts gb.to_biosequence
file.close