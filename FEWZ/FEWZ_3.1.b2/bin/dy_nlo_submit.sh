#!/bin/sh
#SBATCH --job-name=DYNLO #Job name
#SBATCH --mail-type=FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=bregnery@ufl.edu # Where to send mail	
#SBATCH --mem-per-cpu=2gb # Per processor memory
#SBATCH --time=23:59:00 	# Walltime
#SBATCH --output=/ufrc/avery/bregnery/FEWZforHiggs2mumu/FEWZ/FEWZ_3.1.b2/bin/out/test-%A.out	# Name output file 
#SBATCH --array=1-8

pwd; date; hostname

module load ufrc
module load gcc

#   Run fewzz job  DY 1D in M   PI bkg
#   $1 == input parameter (working directory)

mydir=/ufrc/avery/bregnery/FEWZforHiggs2mumu/FEWZ/FEWZ_3.1.b2/bin
cd $mydir

echo "Working in "`pwd`

echo "Will run DY NLO job with parameter = " $SLURM_ARRAY_TASK_ID

# Declare an array variable

declare -a arr=( "mu13tev-higgs-110-160-1jet" "mu13tev-higgs-110-160-full"
                 "mu13tev-higgs-110-160-cc" "mu13tev-higgs-110-160-ncnc"
                 "mu13tev-higgs-110-310-1jet" "mu13tev-higgs-110-310-full"
                 "mu13tev-higgs-110-310-cc" "mu13tev-higgs-110-310-ncnc" )

./local_run.sh z ${arr[$SLURM_ARRAY_TASK_ID-1]} ${arr[$SLURM_ARRAY_TASK_ID-1]}-input.txt ${arr[$SLURM_ARRAY_TASK_ID-1]}-histograms.txt ${arr[$SLURM_ARRAY_TASK_ID-1]}-results.dat .. 1

date

