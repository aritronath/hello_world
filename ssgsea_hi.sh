#!/bin/bash
#SBATCH --ntasks=200
#SBATCH --mem=150G
#SBATCH --time=12:00:00
#SBATCH --output=log.hi
#SBATCH --workdir=/net/isi-dcnl/ifs/user_data/abild/aritro
#SBATCH -p fast,all,abild
#SBATCH --mail-type=ALL
#SBATCH --mail-user=anath@coh.org

export R_LIBS=/home/anath/miniconda3/envs/ssGSEA/lib/R/library/
export PATH=$PATH:/home/anath/anath.grp/Software/BETSY/lib64/python2.7/site-packages/genomicode/bin:/home/anath/miniconda3/envs/ssGSEA/lib/R/bin

Database=/home/jichen/Projects/Database/MSigDB
count_path=/net/isi-dcnl/ifs/user_data/abild/aritro/COH051

betsy_run.py --environment coh_slurm --receipt betsy_scRNA_ssGSEA_receipt.txt --num_cores 200 \
    --network_json betsy_scRNA_ssGSEA_network_json.txt --network_png betsy_scRNA_ssGSEA_network.pdf \
    --input SignalFile --input_file $count_path/X965X9.noaggr.counts.txt \
    --dattr SignalFile.preprocess=counts\
    --dattr SignalFile.has_human_gene_info=no\
    --output ssGSEAResults --output_file COH051_c200\.ssGSEA \
    --mattr geneset_file=$Database/c2.all.v6.2.symbols.gmt \
    --mattr geneset_file2=$Database/h.all.v6.2.symbols.gmt \
    --mattr gsva_min_geneset_size=10 \
    --run
