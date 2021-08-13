#!/bin/bash

for genomes in /home/breena/Documents/Project/168fna/*;
	do 
echo $genomes;	
strain_name=$(basename -s .fna $genomes);
echo $strain_name;
mkdir /home/breena/Documents/Project/isolates_dna_blastdb/$strain_name;
makeblastdb -in $genomes -dbtype nucl -title $strain_name -out /home/breena/Documents/Project/isolates_dna_blastdb/$strain_name/$strain_name/; 
	done
 
