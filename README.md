FEWZforHiggs2mumu
=================

This repository contains programs for creating FEWZ histograms for the CMS H2mumu search.

Setting up the HiPerGator 2.0 Development Mode
==============================================

Load the necessary modules and enter development mode of the University of Florida's HiPerGator 2.0.

    module load ufrc
    module load gcc
    srundev --time=04:00:00

Submitting Jobs on the HiPerGator 2.0
=====================================

This is an example of how to submit a job. The submit script used in this example is FEWZforHiggs2mumu/FEWZ/FEWZ_3.1.b2/bin/dy_nlo_submit.sh

    sbatch dy_nlo_submit.sh
    squeue -u <username>

Installation Instructions
=========================

Clone this git repository.

    git clone https://github.com/bregnery/FEWZforHiggs2mumu.git

FEWZ Local Run Instructions
===========================

In order to run the FEWZ program, first change into the FEWZ bin directory. Then copy the input.txt and histograms.txt from the desired directory to the bin directory. Now run the local version of FEWZ in the bin by using the shell script local_run.sh with the following command.

    ./local_run.sh z <run_dir> input.txt histograms.txt results.dat .. <number_of_processors>

The run_dir is a directory created in order to store information from the run. The default number_of_processors is one.

    ./finish.sh <run_dir> <order_prefix>.<name_of_results_file>.dat

The possible order prefixes are LO, NLO, and NNLO.

 
