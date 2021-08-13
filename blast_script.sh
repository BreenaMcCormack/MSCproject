#!/bin/bash

for queryfile in /home/breena/Documents/Project/query_folder/*;

do query=$(basename $queryfile);
touch /home/breena/Documents/Project/blastresult_folder/"$query"_output.csv;
#touch /home/breena/Documents/Project/blastresult_folder/"$query"_output5.csv;

for databases in /home/breena/Documents/Project/isolates_dna_blastdb/*;
do
echo $databases;
db_name=$(echo $databases|cut -d \/ -f 7);
#echo $db_name
#blastn -query $queryfile -db $databases/$db_name -outfmt 5 | head -n 51| tail -n 1 | cut -d \> -f 2 | cut -d \< -f 1 >> /home/breena/Documents/Project/blastresult_folder/"$query"_output5.csv;

blastn -query $queryfile -db $databases/$db_name -outfmt '6 pident qcovs sstart send saccver sseq' | head -n 1 >> /home/breena/Documents/Project/blastresult_folder/"$query"_output.csv;
done
done

#test lines
#blastn -query /home/breena/Documents/Project/finished_query/lmo1428.fasta -db /home/breena/Documents/Project/isolates_dna_blastdb/946/946 -outfmt 5 | head -n 51 | tail -n 1 >> /home/breena/Documents/Project/blasttest_folder/946_output5.csv
#blastn -query /home/breena/Documents/Project/finished_query/lmo1428.fasta -db /home/breena/Documents/Project/isolates_dna_blastdb/946/946 -outfmt '6 pident qcovs sstart send saccver' >> /home/breena/Documents/Project/blasttest_folder/946_output6.csv


#% identity - pident
#% coverage - qcovs
#saccver - saccver
#subject start and end - sstart/send


