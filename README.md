Bioinformatics
=============

First project for Bioinformatics course at ITBA. Year 2013.

Instructions
============

* `Ex1.rb` Generates a Fasta sequence file from a GenBank input file
  * `ruby src/Ex1.rb input_file_path output_file_path`
  * `input_file_path` is the file path for a GenBank input file
  * `output_file_path` is the file path for the fasta output file
  * Example: `ruby src/Ex1.rb files/genbank/tritricum_globulin.gbk outputs/Ex1.fas`

* `Ex2.rb` Generates a Blast report from a Fasta file
  * `ruby src/Ex2.rb input_file_path output_file_path type`
  * `input_file_path` is the file path for the fasta input file
  * `output_file_path` is the file path for the blast report output file
  * `type` is either `--prot` or `--nuc`
  * Example: `ruby src/Ex2.rb files/fasta/maize_globulin.fas outputs/Ex2.out --nuc`

* `Ex3.rb` Parses a Blast report and shows the hits that matches a pattern. 
  * `ruby src/Ex3.rb input_file_path output_file_path pattern type`
  * `input_file_path` is the file path for the blast report input file
  * `output_file_path` is the file path for the blast parsed output file
  * `type` is either `--prot` or `--nuc`
  * `pattern` is the pattern that will match a description
  * Example: `ruby src/Ex3.rb files/blast/maize_globulin.xml outputs/Ex3.out mays --nuc`

* `Ex4.rb` Runs the EMBOSS Water command for two proteins.
  * `ruby src/Ex4.rb output_file_path`
  * `output_file_path` is the file path for the water command result output file
  * For OSX EMBOSS installation `http://nodens.ceab.csic.es/t-rfpred/mac#EMB`
  * Example: `ruby src/Ex4.rb outputs/Ex4.out`

* `files` folder contains `blast`, `fasta` and `genbank` example input files
* `outputs` folder contains some output example files
* `src` folder contains the different scripts
  
