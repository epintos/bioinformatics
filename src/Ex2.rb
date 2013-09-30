#!/usr/bin/env ruby

puts 'Exercise 2'

require 'bio'

Bio::Blast.reports(ARGF) do |report|
  puts "Hits for " + report.query_def + " against " + report.db
  report.each do |hit|
    print hit.target_id, " -> ", hit.evalue if hit.evalue < 0.001
  end
end